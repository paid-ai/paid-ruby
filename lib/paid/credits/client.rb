# frozen_string_literal: true

module Paid
  module Credits
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List credit currencies for the organization. Includes active and archived currencies by default; use the status
      # query parameter to filter.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Paid::Credits::Types::ListCreditCurrenciesRequestStatus, nil] :status
      #
      # @example
      #   client.credits.list_credit_currencies
      #
      # @return [Paid::Types::CreditCurrencyListResponse]
      def list_credit_currencies(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["status"] = params[:status] if params.key?(:status)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "credits/currencies",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CreditCurrencyListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a credit currency for the organization.
      #
      # @param request_options [Hash]
      # @param params [Paid::Credits::Types::CreateCreditCurrencyRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credits.create_credit_currency(
      #     name: "API Credits",
      #     key: "api_credits",
      #     description: "Credits consumed by API calls."
      #   )
      #
      # @return [Paid::Types::CreditCurrency]
      def create_credit_currency(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credits/currencies",
          body: Paid::Credits::Types::CreateCreditCurrencyRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CreditCurrency.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List credit ledger transactions (grants, spends, and pending grants) for the organization, newest first. Filter
      # by customer, credit currency, type, order, or date range.
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
      # @option params [String, nil] :credits_currency_id
      # @option params [String, nil] :credit_currency_key
      # @option params [Paid::Credits::Types::ListCreditTransactionsRequestType, nil] :type
      # @option params [String, nil] :order_id
      # @option params [String, nil] :event_name
      # @option params [String, nil] :created_at_from
      # @option params [String, nil] :created_at_to
      #
      # @example
      #   client.credits.list_credit_transactions
      #
      # @return [Paid::Types::CreditTransactionListResponse]
      def list_credit_transactions(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)
        query_params["creditCurrencyKey"] = params[:credit_currency_key] if params.key?(:credit_currency_key)
        query_params["type"] = params[:type] if params.key?(:type)
        query_params["orderId"] = params[:order_id] if params.key?(:order_id)
        query_params["eventName"] = params[:event_name] if params.key?(:event_name)
        query_params["createdAtFrom"] = params[:created_at_from] if params.key?(:created_at_from)
        query_params["createdAtTo"] = params[:created_at_to] if params.key?(:created_at_to)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "credits/transactions",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CreditTransactionListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Aggregate credit ledger transactions of one type into period buckets grouped by a dimension, for charting credit
      # consumption over time. Accepts the same filters as the transaction list and reads the same ledger, so bucket
      # totals always match summing that list over the same filters and the same `type` — pass this endpoint's effective
      # `type` (it defaults to `spend`) to the list, which has no default and otherwise returns every type.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :customer_id
      # @option params [String, nil] :external_customer_id
      # @option params [String, nil] :credits_currency_id
      # @option params [String, nil] :credit_currency_key
      # @option params [Paid::Credits::Types::GetCreditTransactionSummaryRequestType, nil] :type
      # @option params [String, nil] :order_id
      # @option params [String, nil] :event_name
      # @option params [String] :created_at_from
      # @option params [String, nil] :created_at_to
      # @option params [Paid::Credits::Types::GetCreditTransactionSummaryRequestGroupBy] :group_by
      # @option params [Paid::Credits::Types::GetCreditTransactionSummaryRequestInterval] :interval
      #
      # @example
      #   client.credits.get_credit_transaction_summary(
      #     created_at_from: "createdAtFrom",
      #     group_by: "eventName",
      #     interval: "day"
      #   )
      #
      # @return [Paid::Types::CreditTransactionSummaryResponse]
      def get_credit_transaction_summary(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)
        query_params["creditCurrencyKey"] = params[:credit_currency_key] if params.key?(:credit_currency_key)
        query_params["type"] = params[:type] if params.key?(:type)
        query_params["orderId"] = params[:order_id] if params.key?(:order_id)
        query_params["eventName"] = params[:event_name] if params.key?(:event_name)
        query_params["createdAtFrom"] = params[:created_at_from] if params.key?(:created_at_from)
        query_params["createdAtTo"] = params[:created_at_to] if params.key?(:created_at_to)
        query_params["groupBy"] = params[:group_by] if params.key?(:group_by)
        query_params["interval"] = params[:interval] if params.key?(:interval)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "credits/transactions/summary",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CreditTransactionSummaryResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a credit currency description or set its active/archive status.
      #
      # @param request_options [Hash]
      # @param params [Paid::Credits::Types::UpdateCreditCurrencyRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.credits.update_credit_currency_by_id(
      #     id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf",
      #     description: "Credits consumed by developer API calls.",
      #     status: "archived"
      #   )
      #
      # @return [Paid::Types::CreditCurrency]
      def update_credit_currency_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Credits::Types::UpdateCreditCurrencyRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "credits/currencies/#{URI.encode_uri_component(params[:id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CreditCurrency.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
