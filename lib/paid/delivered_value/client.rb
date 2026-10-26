# frozen_string_literal: true

module Paid
  module DeliveredValue
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the value delivered to a customer over a period, computed live from your active value model on every
      # call — per value metric: its definition, a display-ready calculation, the measured unit total, monetary total,
      # and signal counts, plus a per-event signal breakdown. The same data a value receipt presents, without creating
      # one — built for value dashboards and reporting. Figures always reflect the currently active value model. Shortly
      # after you publish a model change, totals can still be priced under the previous model's rates.
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
      # @option params [String] :start_date
      # @option params [String] :end_date
      #
      # @example
      #   client.delivered_value.get_delivered_value(
      #     start_date: "2026-08-01",
      #     end_date: "2026-08-31"
      #   )
      #
      # @return [Paid::Types::DeliveredValueResponse]
      def get_delivered_value(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["startDate"] = params[:start_date] if params.key?(:start_date)
        query_params["endDate"] = params[:end_date] if params.key?(:end_date)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "delivered-value/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::DeliveredValueResponse.load(response.body))
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

      # Aggregates delivered value into period buckets for charting value over time, grouped by value metric, by a
      # signal-payload key (for example, value delivered per team_id), or by the formula condition band that priced each
      # row (for example, value delivered per workflow complexity). Any grouping can be narrowed to a single value
      # metric, which is also what lets a dimension grouping state a unit total. Reads the same rows as GET
      # /delivered-value, so summing every bucket's monetaryTotal matches that endpoint's total for the same customer
      # and window. Figures always reflect the currently active value model. Shortly after you publish a model change,
      # totals can still be priced under the previous model's rates. Grouping by band reads a figure recorded when the
      # row was priced, so value delivered before this grouping existed reports under the "none" band until a
      # value-model backfill re-derives it.
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
      # @option params [String] :start_date
      # @option params [String] :end_date
      # @option params [Paid::DeliveredValue::Types::GetDeliveredValueSummaryRequestGroupBy] :group_by
      # @option params [String, nil] :dimension_key
      # @option params [String, nil] :value_metric
      # @option params [Paid::DeliveredValue::Types::GetDeliveredValueSummaryRequestInterval] :interval
      #
      # @example
      #   client.delivered_value.get_delivered_value_summary(
      #     start_date: "2026-08-01",
      #     end_date: "2026-08-31",
      #     group_by: "valueMetric",
      #     dimension_key: "team_id",
      #     value_metric: "it-saving",
      #     interval: "hour"
      #   )
      #
      # @return [Paid::Types::DeliveredValueSummaryResponse]
      def get_delivered_value_summary(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["startDate"] = params[:start_date] if params.key?(:start_date)
        query_params["endDate"] = params[:end_date] if params.key?(:end_date)
        query_params["groupBy"] = params[:group_by] if params.key?(:group_by)
        query_params["dimensionKey"] = params[:dimension_key] if params.key?(:dimension_key)
        query_params["valueMetric"] = params[:value_metric] if params.key?(:value_metric)
        query_params["interval"] = params[:interval] if params.key?(:interval)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "delivered-value/summary",
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
          (response.body.to_s.empty? ? nil : Paid::Types::DeliveredValueSummaryResponse.load(response.body))
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
