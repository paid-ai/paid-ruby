# frozen_string_literal: true

module Paid
  module PaymentAllocations
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Lists payment allocations for a payment or an invoice
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
      # @option params [String, nil] :payment_id
      # @option params [String, nil] :invoice_id
      #
      # @example
      #   client.payment_allocations.list_payment_allocations(
      #     payment_id: "pay_1234abcd",
      #     invoice_id: "inv_1234abcd"
      #   )
      #
      # @return [Paid::Types::PaymentAllocationListResponse]
      def list_payment_allocations(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["paymentId"] = params[:payment_id] if params.key?(:payment_id)
        query_params["invoiceId"] = params[:invoice_id] if params.key?(:invoice_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "payment-allocations/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::PaymentAllocationListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Allocates a payment across one or more invoice lines of posted invoices, in the payment's currency. When an
      # invoice becomes fully paid, its credit entitlements are processed. Returns 409 when a concurrent allocation has
      # already spent the balance.
      #
      # @param request_options [Hash]
      # @param params [Paid::PaymentAllocations::Types::CreatePaymentAllocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_allocations.create_payment_allocation(
      #     payment_id: "pay_1234abcd",
      #     allocations: [{
      #       invoiceLineId: "invoiceLineId",
      #       amount: 15000
      #     }]
      #   )
      #
      # @return [Paid::Types::PaymentAllocationCreateResponse]
      def create_payment_allocation(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment-allocations/",
          body: Paid::PaymentAllocations::Types::CreatePaymentAllocationRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::PaymentAllocationCreateResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
