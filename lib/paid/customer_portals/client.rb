# frozen_string_literal: true

module Paid
  module CustomerPortals
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Deprecated — the customer portal is being retired, and this endpoint will be removed in a future release. It
      # keeps working for existing integrations meanwhile: it creates a portal session for the customer and returns a
      # short-lived URL to the customer portal. Contact Paid before building anything new on it.
      #
      # @param request_options [Hash]
      # @param params [Paid::CustomerPortals::Types::CreateCustomerPortalRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.customer_portals.create_customer_portal
      #
      # @return [Paid::Types::CustomerPortal]
      def create_customer_portal(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customer-portals/",
          body: Paid::CustomerPortals::Types::CreateCustomerPortalRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerPortal.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
