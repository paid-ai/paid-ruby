# frozen_string_literal: true

module Paid
  module Plans
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns plans for your organization, including archived plans by default, optionally filtered to a product.
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
      # @option params [String, nil] :product_id
      # @option params [String, nil] :external_product_id
      # @option params [Boolean, nil] :include_archived
      #
      # @example
      #   client.plans.list_plans
      #
      # @return [Paid::Types::PlanListResponse]
      def list_plans(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["productId"] = params[:product_id] if params.key?(:product_id)
        query_params["externalProductId"] = params[:external_product_id] if params.key?(:external_product_id)
        query_params["includeArchived"] = params[:include_archived] if params.key?(:include_archived)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "plans/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::PlanListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new plan for a product.
      #
      # @param request_options [Hash]
      # @param params [Paid::Plans::Types::CreatePlanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.plans.create_plan(
      #     product_id: "productId",
      #     attributes: [{
      #       productAttributeId: "productAttributeId"
      #     }]
      #   )
      #
      # @return [Paid::Types::Plan]
      def create_plan(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "plans/",
          body: Paid::Plans::Types::CreatePlanRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Plan.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates upgrade path ordering for plans within a product, grouped by billing frequency.
      #
      # @param request_options [Hash]
      # @param params [Paid::Plans::Types::UpdatePlanUpgradePathRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.plans.update_plan_upgrade_path(
      #     product_id: "productId",
      #     groups: [{
      #       planIds: ["planIds"]
      #     }]
      #   )
      #
      # @return [Paid::Types::PlanUpgradePathResponse]
      def update_plan_upgrade_path(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "plans/upgrade-path",
          body: Paid::Plans::Types::UpdatePlanUpgradePathRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::PlanUpgradePathResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a plan by Paid plan ID.
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
      #   client.plans.get_plan_by_id(id: "id")
      #
      # @return [Paid::Types::Plan]
      def get_plan_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "plans/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Plan.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a plan by Paid plan ID. If attributes are provided, they replace the plan's existing attributes. Set
      # status to archive or restore the plan.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::UpdatePlanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.plans.update_plan_by_id(id: "id")
      #
      # @return [Paid::Types::Plan]
      def update_plan_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "plans/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Paid::Types::UpdatePlanRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Plan.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a plan by your external plan ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.plans.get_plan_by_external_id(external_id: "externalId")
      #
      # @return [Paid::Types::Plan]
      def get_plan_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "plans/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Plan.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a plan by your external plan ID. If attributes are provided, they replace the plan's existing attributes.
      # Set status to archive or restore the plan.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::UpdatePlanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.plans.update_plan_by_external_id(external_id: "externalId")
      #
      # @return [Paid::Types::Plan]
      def update_plan_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "plans/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          body: Paid::Types::UpdatePlanRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Plan.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
