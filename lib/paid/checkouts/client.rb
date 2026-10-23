# frozen_string_literal: true

module Paid
  module Checkouts
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get a list of checkouts for the organization
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      # @option params [Paid::Checkouts::Types::ListCheckoutsRequestStatus, nil] :status
      #
      # @example
      #   client.checkouts.list_checkouts
      #
      # @return [Paid::Types::CheckoutListResponse]
      def list_checkouts(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["status"] = params[:status] if params.key?(:status)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "checkouts/",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CheckoutListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a checkout link that generates a URL for a customer to complete a purchase
      #
      # @param request_options [Hash]
      # @param params [Paid::Checkouts::Types::CreateCheckoutRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.checkouts.create_checkout(
      #     products: [{
      #       id: "id"
      #     }],
      #     success_url: "successUrl"
      #   )
      #
      # @return [Paid::Types::Checkout]
      def create_checkout(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "checkouts/",
          body: Paid::Checkouts::Types::CreateCheckoutRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Checkout.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a checkout by ID
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.checkouts.get_checkout(id: "id")
      #
      # @return [Paid::Types::CheckoutDetails]
      def get_checkout(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "checkouts/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CheckoutDetails.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Archive a checkout by ID so it can no longer be paid. A completed (paid) checkout can't be archived and returns
      # 409.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.checkouts.archive_checkout(id: "id")
      #
      # @return [Paid::Types::EmptyResponse]
      def archive_checkout(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "checkouts/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::EmptyResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
