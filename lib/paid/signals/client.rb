# frozen_string_literal: true

module Paid
  module Signals
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns ingested signals (usage events) for your organization, newest first. Filter by signal name, customer,
      # product, and creation date range.
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
      # @option params [String, nil] :signal_name
      # @option params [String, nil] :customer_id
      # @option params [String, nil] :external_customer_id
      # @option params [String, nil] :product_id
      # @option params [String, nil] :external_product_id
      # @option params [String, nil] :created_at_from
      # @option params [String, nil] :created_at_to
      #
      # @example
      #   client.signals.list_signals
      #
      # @return [Paid::Types::SignalListResponse]
      def list_signals(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["signalName"] = params[:signal_name] if params.key?(:signal_name)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["productId"] = params[:product_id] if params.key?(:product_id)
        query_params["externalProductId"] = params[:external_product_id] if params.key?(:external_product_id)
        query_params["createdAtFrom"] = params[:created_at_from] if params.key?(:created_at_from)
        query_params["createdAtTo"] = params[:created_at_to] if params.key?(:created_at_to)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "signals/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::SignalListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            408 => Paid::Types::ErrorResponse,
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Get a single ingested signal (usage event) by its ID, including the data payload submitted at ingest.
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
      #   client.signals.get_signal_by_id(id: "6890b0e2a6f2c30012f0a1b3")
      #
      # @return [Paid::Types::SignalListItem]
      def get_signal_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "signals/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::SignalListItem.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            408 => Paid::Types::ErrorResponse,
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Fetch up to 500 ingested signals (usage events) by ID in one request, each with the data payload submitted at
      # ingest. Use it to resolve the `signalId` values on a page of credit transactions, or the signals behind one run
      # or ticket, instead of calling `GET /api/v2/signals/{id}` once per signal. Signals are returned in request order;
      # IDs that match nothing in your organization are listed under `notFound` rather than failing the request. This is
      # a read-only operation: it requires the `read:usage` scope and is not available to customer API keys.
      #
      # @param request_options [Hash]
      # @param params [Paid::Signals::Types::SignalLookupRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signals.get_signals_by_ids(ids: %w[6890b0e2a6f2c30012f0a1b3 6890b0e2a6f2c30012f0a1b4])
      #
      # @return [Paid::Types::SignalLookupResponse]
      def get_signals_by_ids(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signals/lookup",
          body: Paid::Signals::Types::SignalLookupRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::SignalLookupResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Create multiple signals (usage events) in a single request. Each signal names its customer (`customerId` or
      # `externalCustomerId`; an alias of the customer resolves too), its customer unit (`externalCustomerUnitId`: the
      # unit's key, or an alias that points at a unit), or both, plus an optional product attribution (`productId` or
      # `externalProductId`). A unit alone derives the customer from the unit. A unit sent with a customer must belong
      # to it, else the batch is refused with `400 CUSTOMER_UNIT_MISMATCH`. A unit is never named by Paid's unit id. A
      # key or alias that matches nothing is stored without a customer, keeping the id, so it can be pointed at a unit
      # later. An identifier is matched as a unit key first, then a customer external id, then an alias. Unit
      # attribution is enabled per organization: where it is not, a `customerUnit` sent next to a `customer` is accepted
      # and ignored rather than checked, as before, while a unit named alone still derives its customer. Authenticate
      # with your organization API key, or with a customer API key (prefixed `paid_ck_live_` or `paid_ck_test_`, created
      # with `POST /api/v2/customers/{id}/api-keys`) so a customer's own runtime can report its usage without holding
      # your organization key. A customer API key can call this endpoint only, and only for its own customer: if any
      # signal names another customer, or one Paid does not know, the whole batch is refused with `403`
      # `CUSTOMER_MISMATCH` and nothing is stored. Its idempotency keys are scoped to that customer. See [Send signals
      # with a customer API key](/documentation/signals/send-signals-with-a-customer-api-key).
      #
      # @param request_options [Hash]
      # @param params [Paid::Signals::Types::BulkSignalsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signals.create_signals(signals: [{
      #     eventName: "email_sent",
      #     customer: {
      #       externalCustomerId: "acme-corp",
      #       customerId: "string"
      #     },
      #     attribution: {
      #       externalProductId: "email-agent",
      #       productId: "string"
      #     },
      #     timestamp: "2026-01-31T23:00:00Z",
      #     data: {
      #       recipients: 3
      #     },
      #     idempotencyKey: "email_sent_msg_8f3a2c"
      #   }, {
      #     eventName: "email_sent",
      #     customerUnit: {
      #       externalCustomerUnitId: "acme-marketing"
      #     },
      #     idempotencyKey: "email_sent_msg_9b41d7"
      #   }])
      #
      # @return [Paid::Types::BulkSignalsResponse]
      def create_signals(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signals/bulk",
          body: Paid::Signals::Types::BulkSignalsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::BulkSignalsResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Produces a usage summary file: one row per customer per month, with columns broken down by the signal payload
      # fields you name. Choose `format` to get JSON or a wide CSV; JSON is the default. The export runs in the
      # background, so this returns immediately with a pending export and the file appears on it once it succeeds. Give
      # `spec` to describe the columns, or `copyFrom` with an earlier export's id to reuse that export's columns over a
      # new window. The spec is stored on the export, so an old file can always be explained by the export that produced
      # it. Signals are bucketed by month in UTC on their effective timestamp, the same basis billing uses, so the
      # totals reconcile with invoices. One export runs per organization at a time.
      #
      # @param request_options [Hash]
      # @param params [Paid::Signals::Types::CreateSignalSummaryExportRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signals.create_signal_summary_export(
      #     from: "2025-09-01",
      #     to: "2026-09-01"
      #   )
      #
      # @return [Paid::Types::SignalSummaryExport]
      def create_signal_summary_export(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signals/summary/batch/",
          body: Paid::Signals::Types::CreateSignalSummaryExportRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::SignalSummaryExport.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns one export with its status and the shape it ran. While it is succeeded and unexpired, each read issues a
      # fresh short-lived download link.
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
      #   client.signals.get_signal_summary_export(id: "sse_5pZa1Kd8Nqx")
      #
      # @return [Paid::Types::SignalSummaryExport]
      def get_signal_summary_export(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "signals/summary/batch/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::SignalSummaryExport.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Counts signals into period buckets. Use it to chart signal volume over time, split by signal name or by a
      # signal-payload key such as team_id.
      #
      # Signals count against their effective timestamp in UTC. This is the same basis billing uses, so these figures
      # reconcile with an invoice.
      #
      # The endpoint reads a pre-aggregated hourly rollup, not the raw signals. An hour is therefore the finest
      # interval. One request may span at most 250 periods.
      #
      # A grouped request keeps the 100 groups with the most signals. It sums the rest under the key "other". Each
      # period total stays complete, but a group inside "other" loses its own figure. Read groups.truncated to learn how
      # many groups lost it. Zero means every group kept its own figure.
      #
      # Results are paged with limit and cursor. A page is never truncated in silence.
      #
      # For a wide per-customer spreadsheet over arbitrary payload fields, use the batch export at
      # /signals/summary/batch instead.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :start_date
      # @option params [String] :end_date
      # @option params [Paid::Signals::Types::GetSignalSummaryRequestInterval] :interval
      # @option params [String, nil] :customer_id
      # @option params [String, nil] :external_customer_id
      # @option params [String, nil] :signal_names
      # @option params [Paid::Signals::Types::GetSignalSummaryRequestGroupBy, nil] :group_by
      # @option params [String, nil] :dimension_key
      # @option params [Paid::Signals::Types::GetSignalSummaryRequestFormat, nil] :format
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :cursor
      #
      # @example
      #   client.signals.get_signal_summary(
      #     start_date: "2026-08-01",
      #     end_date: "2026-08-31",
      #     interval: "hour",
      #     dimension_key: "team_id",
      #     limit: 1000
      #   )
      #
      # @return [Paid::Types::SignalSummaryResponse]
      def get_signal_summary(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["startDate"] = params[:start_date] if params.key?(:start_date)
        query_params["endDate"] = params[:end_date] if params.key?(:end_date)
        query_params["interval"] = params[:interval] if params.key?(:interval)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["signalNames"] = params[:signal_names] if params.key?(:signal_names)
        query_params["groupBy"] = params[:group_by] if params.key?(:group_by)
        query_params["dimensionKey"] = params[:dimension_key] if params.key?(:dimension_key)
        query_params["format"] = params[:format] if params.key?(:format)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "signals/summary/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::SignalSummaryResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            408 => Paid::Types::ErrorResponse,
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end
    end
  end
end
