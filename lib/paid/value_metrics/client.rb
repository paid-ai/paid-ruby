# frozen_string_literal: true

module Paid
  module ValueMetrics
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the value metrics in the current value model, without their formulas. Archived metrics are hidden unless
      # includeArchived is true.
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
      # @option params [Boolean, nil] :include_archived
      #
      # @example
      #   client.value_metrics.list_value_metrics
      #
      # @return [Paid::Types::ValueMetricListResponse]
      def list_value_metrics(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["includeArchived"] = params[:include_archived] if params.key?(:include_archived)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-metrics/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueMetricListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Adds one value metric — its unit, formula, signal binding and optional monetary conversion — to the value model.
      # The signal must already exist: an event name your organization has sent, or one referenced by usage pricing on
      # an active product. Publishes a new value model version that values NEW signals going forward; it does NOT
      # recalculate historical delivered value. Re-rating history is a separate, explicit action (POST
      # /api/v2/value-models/backfill).
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueMetrics::Types::CreateValueMetricRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.value_metrics.create_value_metric(
      #     name: "Time saved",
      #     unit: {
      #       type: "monetary"
      #     },
      #     formula: {
      #       expression: "minutes_saved / 60",
      #       variables: [{
      #         id: "id",
      #         label: "label"
      #       }]
      #     },
      #     signal: {
      #       eventName: "ticket_resolved"
      #     }
      #   )
      #
      # @return [Paid::Types::ValueMetricWriteAck]
      def create_value_metric(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-metrics/",
          body: Paid::ValueMetrics::Types::CreateValueMetricRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueMetricWriteAck.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns one value metric with its formula, signal binding and monetary conversion joined together. Call
      # getCurrentValueModel if you need the active version number to guard a follow-up write.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      #
      # @example
      #   client.value_metrics.get_value_metric(slug: "slug")
      #
      # @return [Paid::Types::ValueMetricDetail]
      def get_value_metric(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-metrics/#{URI.encode_uri_component(params[:slug].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueMetricDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Marks a value metric archived so it stops appearing in listValueMetrics. Its formula and signal bindings are
      # deliberately kept, so historical delivered value and sealed value receipts still resolve — which also means an
      # archived metric's signals continue to be ingested and can still surface on value receipts. Removing it from
      # receipts entirely requires deleting its signal bindings. Restore it with updateValueMetric and archivedAt null.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [Integer, nil] :expected_active_version
      #
      # @example
      #   client.value_metrics.archive_value_metric(slug: "slug")
      #
      # @return [Paid::Types::ValueMetricWriteAck]
      def archive_value_metric(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["expectedActiveVersion"] = params[:expected_active_version] if params.key?(:expected_active_version)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "value-metrics/#{URI.encode_uri_component(params[:slug].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueMetricWriteAck.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Changes one value metric. Omitted fields are left alone. You can change its name, category, unit,
      # customer-facing copy, sources, monetary rate, archive state, and the value, label or display format of any
      # variable its formula declares. The formula expression and the signal it is bound to cannot be changed — recreate
      # the metric, or use the whole value-model upload. Publishes a new value model version.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueMetrics::Types::UpdateValueMetricRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      #
      # @example
      #   client.value_metrics.update_value_metric(slug: "slug")
      #
      # @return [Paid::Types::ValueMetricWriteAck]
      def update_value_metric(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueMetrics::Types::UpdateValueMetricRequest.new(params).to_h
        non_body_param_names = %w[slug]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "value-metrics/#{URI.encode_uri_component(params[:slug].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueMetricWriteAck.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
