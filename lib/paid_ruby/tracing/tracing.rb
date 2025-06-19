# frozen_string_literal: true

require "opentelemetry/sdk"
require "opentelemetry/exporter/otlp"
require_relative "logging"

module Paid
  module Tracing
    @token = nil

    # Context keys to propagate external_customer_id and token to child spans.
    # These are just keys, not the values themselves.
    PAID_EXTERNAL_CUSTOMER_ID_KEY = OpenTelemetry::Context.create_key("paid.external_customer_id")
    PAID_TOKEN_KEY = OpenTelemetry::Context.create_key("paid.token")

    # @param api_key [String]
    def self.initialize_tracing(api_key:)
      endpoint = "https://collector.agentpaid.io:4318/v1/traces"
      # endpoint = "http://localhost:4318/v1/traces"

      @token = api_key

      exporter = OpenTelemetry::Exporter::OTLP::Exporter.new(
        endpoint: endpoint,
        headers: {}
      )
      span_processor = OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(exporter)

      OpenTelemetry::SDK.configure do |c|
        c.add_span_processor(span_processor)
      end

      # Add an at_exit hook to ensure spans are flushed before the script exits.
      at_exit do
        OpenTelemetry.tracer_provider.shutdown
      end

      Logging.logger.info("Paid tracing initialized successfully")
    rescue StandardError => e
      Logging.logger.error("Failed to initialize Paid tracing: #{e.message}")
      raise
    end

    def self.token
      @token
    end

    # Getter for the OpenAI wrapper to retrieve the external_customer_id from the context.
    def self.get_external_customer_id_from_context
      OpenTelemetry::Context.current.value(PAID_EXTERNAL_CUSTOMER_ID_KEY)
    end

    # Getter for the OpenAI wrapper to retrieve the token from the context.
    def self.get_token_from_context
      OpenTelemetry::Context.current.value(PAID_TOKEN_KEY)
    end

    # @param external_customer_id [String]
    # @param args [Array]
    # @param block [Proc]
    def self.capture(*args, external_customer_id:, &block)
      token = self.token
      unless token
        Logging.logger.warn("No token found - tracing is not initialized and will not be captured")
        return yield(*args) if block_given?
      end

      new_context_values = {
        PAID_EXTERNAL_CUSTOMER_ID_KEY => external_customer_id,
        PAID_TOKEN_KEY => token
      }

      # Execute the block within a new context containing our values.
      OpenTelemetry::Context.with_values(new_context_values) do
        tracer = OpenTelemetry.tracer_provider.tracer("paid.ruby")

        tracer.in_span("paid.ruby:#{external_customer_id}") do |span|
          span.set_attribute("external_customer_id", external_customer_id)
          span.set_attribute("token", token)

          begin
            result = yield(*args) if block_given?
            span.status = OpenTelemetry::Trace::Status.ok("Success")
            result
          rescue StandardError => e
            span.status = OpenTelemetry::Trace::Status.error("Error: #{e.message}")
            raise e
          end
        end
      end
    end
  end
end
