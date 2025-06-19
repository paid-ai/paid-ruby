# frozen_string_literal: true

require "openai"
require_relative "../tracing"

module Paid
  module Tracing
    module Wrappers
      # A wrapper around the OpenAI::Client that provides automatic tracing for API calls.
      class PaidOpenAI
        def initialize(openai_client:)
          @openai_client = openai_client
          @tracer = OpenTelemetry.tracer_provider.tracer("paid.ruby")
        end

        # Wraps the OpenAI#chat method to create a child span.
        def chat(parameters:)
          wrap_call(operation: "chat", model: parameters[:model]) do
            @openai_client.chat(parameters: parameters)
          end
        end

        # Wraps the OpenAI#embeddings method to create a child span.
        def embeddings(parameters:)
          wrap_call(operation: "embeddings", model: parameters[:model]) do
            @openai_client.embeddings(parameters: parameters)
          end
        end

        # Returns a wrapper for the images API.
        def images
          ImagesWrapper.new(openai_client: @openai_client, tracer: @tracer)
        end

        private

        # A private wrapper for the OpenAI Images API.
        class ImagesWrapper
          def initialize(openai_client:, tracer:)
            @openai_client = openai_client
            @tracer = tracer
          end

          def generate(parameters:)
            current_span = OpenTelemetry::Trace.current_span
            unless current_span.context.valid?
              Paid::Tracing::Logging.logger.warn("No active span found, calling OpenAI directly without tracing.")
              return @openai_client.images.generate(parameters: parameters)
            end

            external_customer_id = Paid::Tracing.get_external_customer_id_from_context
            token = Paid::Tracing.get_token_from_context
            model = parameters[:model] || "dall-e-3"
            span_name = "trace.images #{model}"

            @tracer.in_span(span_name) do |span|
              attributes = {
                "gen_ai.request.model" => model,
                "gen_ai.system" => "openai",
                "gen_ai.operation.name" => "image_generation"
              }
              attributes["external_customer_id"] = external_customer_id if external_customer_id
              attributes["token"] = token if token
              span.add_attributes(attributes)

              begin
                response = @openai_client.images.generate(parameters: parameters)
                span.add_attributes({
                                      "gen_ai.image.count" => parameters[:n] || 1,
                                      "gen_ai.image.size" => parameters[:size] || "1024x1024",
                                      "gen_ai.image.quality" => parameters[:quality] || "standard"
                                    })
                span.status = OpenTelemetry::Trace::Status.ok("Success")
                response
              rescue StandardError => e
                span.record_exception(e)
                span.status = OpenTelemetry::Trace::Status.error("Error: #{e.message}")
                raise e
              end
            end
          end
        end

        def wrap_call(operation:, model:, &block)
          current_span = OpenTelemetry::Trace.current_span
          unless current_span.context.valid?
            Paid::Tracing::Logging.logger.warn("No active span found, calling OpenAI directly without tracing.")
            return yield
          end

          external_customer_id = Paid::Tracing.get_external_customer_id_from_context
          token = Paid::Tracing.get_token_from_context
          model_name = model || "unknown"
          span_name = "trace.#{operation} #{model_name}"

          @tracer.in_span(span_name) do |span|
            attributes = {
              "gen_ai.system" => "openai",
              "gen_ai.operation.name" => operation
            }
            attributes["external_customer_id"] = external_customer_id if external_customer_id
            attributes["token"] = token if token
            span.add_attributes(attributes)

            begin
              response = yield
              add_response_attributes(span, response)
              span.status = OpenTelemetry::Trace::Status.ok("Success")
              response
            rescue StandardError => e
              span.record_exception(e)
              span.status = OpenTelemetry::Trace::Status.error("Error: #{e.message}")
              raise e
            end
          end
        end

        def add_response_attributes(span, response)
          return unless response.is_a?(Hash) && response.dig("usage")

          attributes = {
            "gen_ai.usage.input_tokens" => response.dig("usage", "prompt_tokens"),
            "gen_ai.usage.output_tokens" => response.dig("usage", "completion_tokens"),
            "gen_ai.response.model" => response.dig("model")
          }.compact

          span.add_attributes(attributes)
        end
      end
    end
  end
end
