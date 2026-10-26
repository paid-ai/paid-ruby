# frozen_string_literal: true

module Paid
  module Invoices
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get a list of invoices for the organization
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
      # @option params [String, nil] :customer_id
      # @option params [String, nil] :external_customer_id
      # @option params [String, nil] :order_id
      # @option params [Paid::Invoices::Types::ListInvoicesRequestStatus, nil] :status
      # @option params [Paid::Invoices::Types::ListInvoicesRequestPaymentStatus, nil] :payment_status
      # @option params [String, nil] :issue_date_from
      # @option params [String, nil] :issue_date_to
      # @option params [String, nil] :due_date_from
      # @option params [String, nil] :due_date_to
      # @option params [String, nil] :display_number
      # @option params [String, nil] :purchase_order_reference
      # @option params [String, nil] :currency
      #
      # @example
      #   client.invoices.list_invoices
      #
      # @return [Paid::Types::InvoiceListResponse]
      def list_invoices(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["orderId"] = params[:order_id] if params.key?(:order_id)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["paymentStatus"] = params[:payment_status] if params.key?(:payment_status)
        query_params["issueDateFrom"] = params[:issue_date_from] if params.key?(:issue_date_from)
        query_params["issueDateTo"] = params[:issue_date_to] if params.key?(:issue_date_to)
        query_params["dueDateFrom"] = params[:due_date_from] if params.key?(:due_date_from)
        query_params["dueDateTo"] = params[:due_date_to] if params.key?(:due_date_to)
        query_params["displayNumber"] = params[:display_number] if params.key?(:display_number)
        query_params["purchaseOrderReference"] = params[:purchase_order_reference] if params.key?(:purchase_order_reference)
        query_params["currency"] = params[:currency] if params.key?(:currency)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "invoices/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::InvoiceListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get an invoice by ID
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
      #   client.invoices.get_invoice_by_id(id: "id")
      #
      # @return [Paid::Types::Invoice]
      def get_invoice_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "invoices/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Invoice.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update an invoice by ID
      #
      # @param request_options [Hash]
      # @param params [Paid::Invoices::Types::UpdateInvoiceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.invoices.update_invoice_by_id(id: "id")
      #
      # @return [Paid::Types::Invoice]
      def update_invoice_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Invoices::Types::UpdateInvoiceRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "invoices/#{URI.encode_uri_component(params[:id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::Invoice.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get the invoice lines for an invoice by ID
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.invoices.get_invoice_lines(id: "id")
      #
      # @return [Paid::Types::InvoiceLinesResponse]
      def get_invoice_lines(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "invoices/#{URI.encode_uri_component(params[:id].to_s)}/lines",
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
          (response.body.to_s.empty? ? nil : Paid::Types::InvoiceLinesResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
