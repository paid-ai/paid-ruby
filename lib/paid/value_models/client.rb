# frozen_string_literal: true

module Paid
  module ValueModels
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the current (latest active) value model for the organization.
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
      #   client.value_models.get_current_value_model
      #
      # @return [Paid::Types::ValueModelDetail]
      def get_current_value_model(request_options: {}, **_params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-models/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueModelDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Uploads a new value model version. Validates the content, creates a new version, archives the previous active
      # version, and syncs to ClickHouse. This updates how value is calculated going forward — new signals are valued
      # under the new model. It does NOT re-rate historical signals; run POST /api/v2/value-models/backfill to re-rate
      # history as a separate, explicit action. Any unpublished draft saved in the Paid app is discarded. Send
      # expectedActiveVersion to get a 409 instead of overwriting a version published since you read it.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueModels::Types::ValueModelUploadRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.value_models.update_value_model(content: {
      #     currency: "currency",
      #     valueTypes: [{
      #       slug: "slug",
      #       name: "name",
      #       calculationTimeline: [{
      #         effectiveFrom: "2024-01-15T09:30:00Z",
      #         calculation: {
      #           unit: {
      #             type: "monetary"
      #           },
      #           formulaIds: ["formulaIds"],
      #           signalEventNames: ["signalEventNames"],
      #           segmentTableIds: ["segmentTableIds"],
      #           overrideIds: ["overrideIds"]
      #         }
      #       }]
      #     }],
      #     formulas: [{
      #       id: "id",
      #       valueTypeSlug: "valueTypeSlug",
      #       label: "label",
      #       variables: [{
      #         id: "id",
      #         label: "label"
      #       }],
      #       expression: "expression"
      #     }],
      #     signals: [{
      #       eventName: "eventName",
      #       label: "label"
      #     }]
      #   })
      #
      # @return [Paid::Types::ValueModelDetail]
      def update_value_model(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "value-models/",
          body: Paid::ValueModels::Types::ValueModelUploadRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueModelDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns all value model versions sorted by version descending. Does not include the full content.
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
      #
      # @example
      #   client.value_models.list_value_model_versions
      #
      # @return [Paid::Types::ValueModelVersionListResponse]
      def list_value_model_versions(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-models/versions",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueModelVersionListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a specific historical value model version by version number, including full content.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer] :version
      #
      # @example
      #   client.value_models.get_value_model_version(version: 1)
      #
      # @return [Paid::Types::ValueModelDetail]
      def get_value_model_version(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-models/versions/#{URI.encode_uri_component(params[:version].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueModelDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Manually triggers a recalculation of all ClickHouse rows against the current value model. Returns 422 when the
      # backfill would scan more signals than the ceiling allows — that is deterministic, so retrying without narrowing
      # the scope will not help.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueModels::Types::RefreshValueModelBackfillRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.value_models.refresh_value_model_backfill
      #
      # @return [Paid::Types::BackfillResponse]
      def refresh_value_model_backfill(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-models/backfill",
          body: Paid::ValueModels::Types::RefreshValueModelBackfillRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::BackfillResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            422 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end
    end
  end
end
