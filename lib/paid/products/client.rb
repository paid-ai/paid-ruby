# frozen_string_literal: true

module Paid
  module Products
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get a list of products for the organization
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
      # @option params [String, nil] :name
      # @option params [Boolean, nil] :active
      # @option params [Boolean, nil] :archived
      #
      # @example
      #   client.products.list_products
      #
      # @return [Paid::Types::ProductListResponse]
      def list_products(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["name"] = params[:name] if params.key?(:name)
        query_params["active"] = params[:active] if params.key?(:active)
        query_params["archived"] = params[:archived] if params.key?(:archived)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "products/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ProductListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new product for the organization. Products are created without pricing: to create product attributes
      # and set their pricing, call the update product endpoint (updateProductById / updateProductByExternalId), which
      # upserts productAttributes.
      #
      # @param request_options [Hash]
      # @param params [Paid::Products::Types::CreateProductRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.products.create_product(name: "name")
      #
      # @return [Paid::Types::Product]
      def create_product(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "products/",
          body: Paid::Products::Types::CreateProductRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Product.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a product by ID, including its product attributes with pricing details
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
      #   client.products.get_product_by_id(id: "id")
      #
      # @return [Paid::Types::ProductDetail]
      def get_product_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "products/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ProductDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a product by ID. Also creates and edits product attributes: productAttributes upserts attributes and sets
      # their pricing (metering event, price points, credit brackets). This is the endpoint to use to add pricing to a
      # product created without any.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::UpdateProductRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.products.update_product_by_id(id: "id")
      #
      # @return [Paid::Types::ProductDetail]
      def update_product_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "products/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Paid::Types::UpdateProductRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ProductDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a product by external ID, including its product attributes with pricing details
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
      #   client.products.get_product_by_external_id(external_id: "externalId")
      #
      # @return [Paid::Types::ProductDetail]
      def get_product_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "products/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ProductDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a product by external ID. Also creates and edits product attributes: productAttributes upserts attributes
      # and sets their pricing (metering event, price points, credit brackets). This is the endpoint to use to add
      # pricing to a product created without any.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::UpdateProductRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.products.update_product_by_external_id(external_id: "externalId")
      #
      # @return [Paid::Types::ProductDetail]
      def update_product_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "products/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          body: Paid::Types::UpdateProductRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ProductDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
