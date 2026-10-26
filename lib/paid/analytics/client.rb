# frozen_string_literal: true

module Paid
  module Analytics
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Runs a single ClickHouse SELECT (or WITH … SELECT) against your organization's analytics views. Before writing a
      # query, call `getAnalyticsSchema` (GET /schema) for the available views and columns, and `getSignalsMetadata`
      # (GET /signals/metadata) for the JSON paths inside `fact_signal.data`. Results are automatically scoped to your
      # organization — no org filter is needed or possible. Only SELECT/WITH statements are accepted.
      #
      # Conventions: monetary amounts are minor units (cents — divide by 100 for the major unit); most are integers, but
      # `fact_cost.cost_amount` is fractional cents (Decimal) since a single AI call usually costs less than a cent;
      # 64-bit integers (counts, ids, amounts) are returned as JSON strings to preserve precision, so parse them
      # client-side; Decimal columns (fractional cents, and credit amounts, which are counts of credits rather than
      # cents and are never divided by 100) come back as JSON numbers instead, so a value beyond 2^53 is already rounded
      # — select toString(col) when you need its exact digits. Query signal payloads via JSON paths, e.g. `SELECT
      # data.country::String AS country, count() FROM fact_signal GROUP BY country`.
      #
      # Limits: 30 seconds of execution time and 10,000 result rows (truncation is flagged via `meta.truncated`).
      # Queries exceeding the 4 GB memory allowance return HTTP 422 with code `QUERY_MEMORY_LIMIT_EXCEEDED`. Prefer
      # aggregates and a `created_at` date filter on large tables — this endpoint is for interactive analytics, not bulk
      # export.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::AnalyticsQueryRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.analytics.execute_analytics_query(query: "SELECT signal_name, count() AS signals FROM fact_signal WHERE created_at > now() - INTERVAL 30 DAY GROUP BY signal_name ORDER BY signals DESC")
      #
      # @return [Paid::Types::AnalyticsQueryResponse]
      def execute_analytics_query(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "analytics/query",
          body: Paid::Types::AnalyticsQueryRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::AnalyticsQueryResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            408 => Paid::Types::ErrorResponse,
            422 => Paid::Types::ErrorResponse,
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Returns the analytics views available to POST /query, with column names, ClickHouse types, and descriptions.
      # Dimensions (`dim_*`) describe entities; facts (`fact_*`) are event/transaction tables that join to dimensions
      # via the `*_id` columns described in each comment.
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
      #   client.analytics.get_analytics_schema
      #
      # @return [Paid::Types::AnalyticsSchemaResponse]
      def get_analytics_schema(request_options: {}, **_params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "analytics/schema",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::AnalyticsSchemaResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists the JSON paths (and their observed types) present in the `data` payload of your signals within a time
      # window (default: last 30 days), grouped by signal name. Use the returned paths in queries against `fact_signal`,
      # e.g. `WHERE data.<path>::String = '...'`. Keys declared as grouping dimensions are marked `declared` with their
      # `slot` and listed first. Where available, each path also carries `firstSeen`, `lastSeen` and a `signals` count;
      # these span all time, and the window only selects which paths and types are returned.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :signal_name
      # @option params [String, nil] :from_date
      # @option params [String, nil] :to_date
      #
      # @example
      #   client.analytics.get_signals_metadata
      #
      # @return [Paid::Types::SignalsMetadataResponse]
      def get_signals_metadata(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["signalName"] = params[:signal_name] if params.key?(:signal_name)
        query_params["fromDate"] = params[:from_date] if params.key?(:from_date)
        query_params["toDate"] = params[:to_date] if params.key?(:to_date)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "analytics/signals/metadata",
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
          (response.body.to_s.empty? ? nil : Paid::Types::SignalsMetadataResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
