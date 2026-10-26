# frozen_string_literal: true

module Paid
  module Amendments
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns which amendments the order admits right now: per-attribute intents and treatment axes with choosable
      # options, defaults, and unavailability reasons, plus the order version, currency, and effective date an amendment
      # request needs.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @example
      #   client.amendments.get_order_amendment_options(order_id: "orderId")
      #
      # @return [Paid::Types::AmendmentOptions]
      def get_order_amendment_options(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "orders/#{URI.encode_uri_component(params[:order_id].to_s)}/amendments/options",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::AmendmentOptions.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Compiles amendment intents into a plan (operations, money effects, credit effects, state diff) without
      # executing. The returned planHash can be passed to the execute endpoint for two-phase, drift-guarded execution.
      #
      # @param request_options [Hash]
      # @param params [Paid::Amendments::Types::UnifiedAmendmentPreviewRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @example
      #   client.amendments.preview_order_amendment(
      #     order_id: "orderId",
      #     order_version: 1,
      #     intents: []
      #   )
      #
      # @return [Paid::Types::AmendmentPlan]
      def preview_order_amendment(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Amendments::Types::UnifiedAmendmentPreviewRequest.new(params).to_h
        non_body_param_names = %w[orderId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "orders/#{URI.encode_uri_component(params[:order_id].to_s)}/amendments/preview",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::AmendmentPlan.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Executes amendment intents against an order. One-shot by default; pass the previewed planHash to require the
      # recomputed plan to match (409 PLAN_CONFLICT on drift).
      #
      # @param request_options [Hash]
      # @param params [Paid::Amendments::Types::UnifiedAmendmentExecuteRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @example
      #   client.amendments.execute_order_amendment(
      #     order_id: "orderId",
      #     order_version: 1,
      #     intents: []
      #   )
      #
      # @return [Paid::Types::UnifiedAmendmentResponse]
      def execute_order_amendment(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Amendments::Types::UnifiedAmendmentExecuteRequest.new(params).to_h
        non_body_param_names = %w[orderId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "orders/#{URI.encode_uri_component(params[:order_id].to_s)}/amendments",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::UnifiedAmendmentResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
