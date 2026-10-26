# frozen_string_literal: true

module Paid
  module Webhooks
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List customer-facing billing webhooks for the authenticated organization, along with whether the organization
      # has generated a signing secret.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.webhooks.list_webhooks
      #
      # @return [Paid::Types::WebhookListResponse]
      def list_webhooks(request_options: {}, **_params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "webhooks/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::WebhookListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Enable or disable a webhook and configure the destination URL for the authenticated organization.
      #
      # @param request_options [Hash]
      # @param params [Paid::Webhooks::Types::UpdateWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Paid::Webhooks::Types::UpdateWebhookRequestWebhookName] :webhook_name
      #
      # @example
      #   client.webhooks.update_webhook(webhook_name: "billing-invoice-created")
      #
      # @return [Paid::Types::WebhookUpdateResponse]
      def update_webhook(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Webhooks::Types::UpdateWebhookRequest.new(params).to_h
        non_body_param_names = %w[webhookName]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "webhooks/#{URI.encode_uri_component(params[:webhook_name].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::WebhookUpdateResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Send a synthetic webhook delivery to the configured destination for this webhook.
      #
      # @param request_options [Hash]
      # @param params [Paid::Webhooks::Types::TestWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Paid::Webhooks::Types::TestWebhookRequestWebhookName] :webhook_name
      #
      # @example
      #   client.webhooks.test_webhook(webhook_name: "billing-invoice-created")
      #
      # @return [Paid::Types::WebhookTestResponse]
      def test_webhook(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Webhooks::Types::TestWebhookRequest.new(params).to_h
        non_body_param_names = %w[webhookName]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "webhooks/#{URI.encode_uri_component(params[:webhook_name].to_s)}/test",
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
          (response.body.to_s.empty? ? nil : Paid::Types::WebhookTestResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Generate a new HMAC signing secret used by every webhook in this organization and return it exactly once. The
      # previous secret is invalidated immediately on next delivery.
      #
      # @param request_options [Hash]
      # @param params [Paid::Webhooks::Types::RotateWebhookSecretRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.webhooks.rotate_webhook_secret
      #
      # @return [Paid::Types::RotateWebhookSecretResponse]
      def rotate_webhook_secret(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "webhooks/rotate-secret",
          body: Paid::Webhooks::Types::RotateWebhookSecretRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::RotateWebhookSecretResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
