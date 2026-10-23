# frozen_string_literal: true

module Paid
  module Customers
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get a list of customers for the organization
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
      # @option params [Paid::Customers::Types::ListCustomersRequestStatus, nil] :status
      # @option params [Paid::Customers::Types::ListCustomersRequestCreationState, nil] :creation_state
      # @option params [String, nil] :created_at_from
      # @option params [String, nil] :created_at_to
      # @option params [String, nil] :external_id
      #
      # @example
      #   client.customers.list_customers
      #
      # @return [Paid::Types::CustomerListResponse]
      def list_customers(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["name"] = params[:name] if params.key?(:name)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["creationState"] = params[:creation_state] if params.key?(:creation_state)
        query_params["createdAtFrom"] = params[:created_at_from] if params.key?(:created_at_from)
        query_params["createdAtTo"] = params[:created_at_to] if params.key?(:created_at_to)
        query_params["externalId"] = params[:external_id] if params.key?(:external_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new customer for the organization. `externalId` shares one set of ids with customer unit ids and
      # aliases, unique across the organization and ignoring letter case: an external id that another customer already
      # holds as a unit id or alias, or as its external id in another case, is refused with `409 EXTERNAL_ID_IN_USE`.
      # The same id in the same case is `400 DUPLICATE_EXTERNAL_ID`, as before.
      #
      # @param request_options [Hash]
      # @param params [Paid::Customers::Types::CreateCustomerRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.customers.create_customer(name: "name")
      #
      # @return [Paid::Types::Customer]
      def create_customer(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/",
          body: Paid::Customers::Types::CreateCustomerRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Customer.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List alternate external identifiers that resolve to a customer by Paid display ID.
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
      #   client.customers.list_customer_aliases(id: "cus_abc123")
      #
      # @return [Paid::Types::CustomerAliasListResponse]
      def list_customer_aliases(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/aliases",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAliasListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create an alternate external identifier for a customer by Paid display ID. The alias shares one set of ids with
      # customer external ids and unit ids, unique within the organization and ignoring letter case: an alias that
      # another customer already holds as its external id, a unit id or an alias is refused with `409
      # EXTERNAL_ID_IN_USE` (an exact match keeps its older code, `ALIAS_CONFLICTS_WITH_CUSTOMER_EXTERNAL_ID` or
      # `CUSTOMER_ALIAS_ALREADY_EXISTS`).
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAliasCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.customers.create_customer_alias(
      #     id: "cus_abc123",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::CustomerAlias]
      def create_customer_alias(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/aliases",
          body: Paid::Types::CustomerAliasCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAlias.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Remove an alternate external identifier from a customer by Paid display ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :alias_
      #
      # @example
      #   client.customers.delete_customer_alias(
      #     id: "cus_abc123",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::EmptyResponse]
      def delete_customer_alias(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/aliases/#{URI.encode_uri_component(params[:alias_].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::EmptyResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a customer by Paid display ID. Use the value returned as `customer.id`, for example `cus_abc123`. If you
      # have your own customer ID, use `GET /api/v2/customers/external/{externalId}`.
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
      #   client.customers.get_customer_by_id(id: "cus_abc123")
      #
      # @return [Paid::Types::Customer]
      def get_customer_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Customer.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a customer by Paid display ID. Use the value returned as `customer.id`, for example `cus_abc123`. If you
      # have your own customer ID, use `PUT /api/v2/customers/external/{externalId}`. Changing `externalId` follows the
      # organization-wide id rule: a new id that another customer already holds as its external id, a unit id or an
      # alias, ignoring letter case, is refused with `409 EXTERNAL_ID_IN_USE`; the same id in the same case stays `400
      # DUPLICATE_EXTERNAL_ID`. When the id changes, the previous id is kept as an alias of the customer, so signals
      # that still use it keep resolving to it.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::UpdateCustomerRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.customers.update_customer_by_id(id: "cus_abc123")
      #
      # @return [Paid::Types::Customer]
      def update_customer_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Paid::Types::UpdateCustomerRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Customer.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a customer by Paid display ID. Use the value returned as `customer.id`, for example `cus_abc123`. If you
      # have your own customer ID, use `DELETE /api/v2/customers/external/{externalId}`. A customer that still has
      # orders, invoices, payments, contacts, child customers or other linked records is not deleted: the request
      # returns 409 `CUSTOMER_HAS_ASSOCIATIONS` and `details` lists what is linked.
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
      #   client.customers.delete_customer_by_id(id: "cus_abc123")
      #
      # @return [Paid::Types::EmptyResponse]
      def delete_customer_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::EmptyResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get the current customer state by Paid display ID
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
      #   client.customers.get_customer_state_by_id(id: "cus_abc123")
      #
      # @return [Paid::Types::CustomerState]
      def get_customer_state_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/state",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerState.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List alternate external identifiers that resolve to a customer by external ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.customers.list_customer_aliases_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::CustomerAliasListResponse]
      def list_customer_aliases_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/aliases",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAliasListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create an alternate external identifier for a customer by external ID. The alias shares one set of ids with
      # customer external ids and unit ids, unique within the organization and ignoring letter case: an alias that
      # another customer already holds as its external id, a unit id or an alias is refused with `409
      # EXTERNAL_ID_IN_USE` (an exact match keeps its older code, `ALIAS_CONFLICTS_WITH_CUSTOMER_EXTERNAL_ID` or
      # `CUSTOMER_ALIAS_ALREADY_EXISTS`).
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAliasCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.customers.create_customer_alias_by_external_id(
      #     external_id: "customer_123",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::CustomerAlias]
      def create_customer_alias_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/aliases",
          body: Paid::Types::CustomerAliasCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAlias.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Remove an alternate external identifier from a customer by external ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :alias_
      #
      # @example
      #   client.customers.delete_customer_alias_by_external_id(
      #     external_id: "customer_123",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::EmptyResponse]
      def delete_customer_alias_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/aliases/#{URI.encode_uri_component(params[:alias_].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::EmptyResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a customer by external ID
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
      #   client.customers.get_customer_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::Customer]
      def get_customer_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Customer.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a customer by external ID. Changing `externalId` follows the organization-wide id rule: a new id that
      # another customer already holds as its external id, a unit id or an alias, ignoring letter case, is refused with
      # `409 EXTERNAL_ID_IN_USE`; the same id in the same case stays `400 DUPLICATE_EXTERNAL_ID`. When the id changes,
      # the previous id is kept as an alias of the customer, so signals that still use it keep resolving to it.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::UpdateCustomerRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.customers.update_customer_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::Customer]
      def update_customer_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          body: Paid::Types::UpdateCustomerRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Customer.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a customer by external ID. A customer that still has orders, invoices, payments, contacts, child
      # customers or other linked records is not deleted: the request returns 409 `CUSTOMER_HAS_ASSOCIATIONS` and
      # `details` lists what is linked.
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
      #   client.customers.delete_customer_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::EmptyResponse]
      def delete_customer_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::EmptyResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Primary integration endpoint for agents and programmatic clients using their own customer IDs. Use the value you
      # stored on `customer.externalId`, for example `customer_123`.
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
      #   client.customers.get_customer_state_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::CustomerState]
      def get_customer_state_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/state",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerState.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get current customer credit balances grouped by currency for a Paid customer display ID. Use the value returned
      # as `customer.id`, for example `cus_abc123`. If you have your own customer ID, use
      # `/api/v2/customers/external/{externalId}/credits/balances`.
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
      #   client.customers.get_customer_credit_balances(id: "cus_abc123")
      #
      # @return [Paid::Types::CreditBalanceListResponse]
      def get_customer_credit_balances(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/credits/balances",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CreditBalanceListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Immediately grant credits to a customer using an active credit currency key.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CreditGrantCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.customers.grant_customer_credits(
      #     id: "cus_abc123",
      #     credit_currency_key: "api_credits",
      #     amount: 10000,
      #     starts_at: "2026-06-05T12:00:00Z",
      #     expires_at: "2026-12-31T23:59:59Z",
      #     idempotency_key: "grant_acme_2026-06-05"
      #   )
      #
      # @return [Paid::Types::GrantCustomerCreditsResponse]
      def grant_customer_credits(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/credits/grants",
          body: Paid::Types::CreditGrantCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::GrantCustomerCreditsResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get current customer credit balances grouped by currency, looked up by external ID
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
      #   client.customers.get_customer_credit_balances_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::CreditBalanceListResponse]
      def get_customer_credit_balances_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/credits/balances",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CreditBalanceListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List credit consumption that was recorded before a matching credit pool existed — for example usage that arrived
      # before an invoice was paid or before a new period's credits were granted. Entries leave this list once they are
      # applied to a pool or settled. Use the value returned as `customer.id`, for example `cus_abc123`. If you have
      # your own customer ID, use `/api/v2/customers/external/{externalId}/credits/pending-consumption`.
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
      #   client.customers.list_customer_pending_credit_consumption(id: "cus_abc123")
      #
      # @return [Paid::Types::PendingCreditConsumptionListResponse]
      def list_customer_pending_credit_consumption(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/credits/pending-consumption",
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
          (response.body.to_s.empty? ? nil : Paid::Types::PendingCreditConsumptionListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List credit consumption recorded before a matching credit pool existed, for a customer looked up by external ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.customers.list_customer_pending_credit_consumption_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::PendingCreditConsumptionListResponse]
      def list_customer_pending_credit_consumption_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/credits/pending-consumption",
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
          (response.body.to_s.empty? ? nil : Paid::Types::PendingCreditConsumptionListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Immediately grant credits to a customer looked up by external ID using an active credit currency key.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CreditGrantCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.customers.grant_customer_credits_by_external_id(
      #     external_id: "customer_123",
      #     credit_currency_key: "api_credits",
      #     amount: 10000,
      #     starts_at: "2026-06-05T12:00:00Z",
      #     expires_at: "2026-12-31T23:59:59Z",
      #     idempotency_key: "grant_acme_2026-06-05"
      #   )
      #
      # @return [Paid::Types::GrantCustomerCreditsResponse]
      def grant_customer_credits_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/credits/grants",
          body: Paid::Types::CreditGrantCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::GrantCustomerCreditsResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create or update a customer user using customer and user external IDs
      #
      # @param request_options [Hash]
      # @param params [Paid::Customers::Types::UpsertCustomerUserRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_external_id
      # @option params [String] :user_external_id
      #
      # @example
      #   client.customers.upsert_customer_user_by_external_id(
      #     customer_external_id: "customerExternalId",
      #     user_external_id: "userExternalId"
      #   )
      #
      # @return [Paid::Types::CustomerUser]
      def upsert_customer_user_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Customers::Types::UpsertCustomerUserRequest.new(params).to_h
        non_body_param_names = %w[customerExternalId userExternalId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "customers/#{URI.encode_uri_component(params[:customer_external_id].to_s)}/users/#{URI.encode_uri_component(params[:user_external_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUser.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the virtual bank account (Stripe funding instructions) a customer can pay by bank transfer into, by Paid
      # display ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :currency
      #
      # @example
      #   client.customers.get_customer_funding_instructions(
      #     id: "cus_abc123",
      #     currency: "USD"
      #   )
      #
      # @return [Paid::Types::CustomerFundingInstructions]
      def get_customer_funding_instructions(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["currency"] = params[:currency] if params.key?(:currency)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/funding-instructions",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerFundingInstructions.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a dedicated virtual bank account for the customer to pay invoices by bank transfer, by Paid display ID.
      # Returns the existing account if one already exists for the currency. Requires a live-mode organization with
      # Stripe connected and Bank Transfers enabled on the Stripe account.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerFundingInstructionsCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.customers.create_customer_funding_instructions(id: "cus_abc123")
      #
      # @return [Paid::Types::CustomerFundingInstructions]
      def create_customer_funding_instructions(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/funding-instructions",
          body: Paid::Types::CustomerFundingInstructionsCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerFundingInstructions.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            422 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Returns the virtual bank account (Stripe funding instructions) a customer can pay by bank transfer into, by your
      # external ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String, nil] :currency
      #
      # @example
      #   client.customers.get_customer_funding_instructions_by_external_id(
      #     external_id: "externalId",
      #     currency: "USD"
      #   )
      #
      # @return [Paid::Types::CustomerFundingInstructions]
      def get_customer_funding_instructions_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["currency"] = params[:currency] if params.key?(:currency)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/funding-instructions",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerFundingInstructions.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a dedicated virtual bank account for the customer to pay invoices by bank transfer, by your external ID.
      # Returns the existing account if one already exists for the currency. Requires a live-mode organization with
      # Stripe connected and Bank Transfers enabled on the Stripe account.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerFundingInstructionsCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.customers.create_customer_funding_instructions_by_external_id(external_id: "externalId")
      #
      # @return [Paid::Types::CustomerFundingInstructions]
      def create_customer_funding_instructions_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/funding-instructions",
          body: Paid::Types::CustomerFundingInstructionsCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerFundingInstructions.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            422 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # Lists the customer's units as a flat list, newest last; assemble the tree from `parentExternalId` (`null` on the
      # root unit, `isRoot: true`). Deleted units are hidden unless `status=DELETED` is given, drafts unless
      # `status=DRAFT`. Filter by `externalType`, or by `parentExternalId` for one level of the tree. Addresses the
      # customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      # @option params [Paid::Customers::Types::ListCustomerUnitsByExternalIDRequestStatus, nil] :status
      # @option params [String, nil] :external_type
      # @option params [String, nil] :parent_external_id
      #
      # @example
      #   client.customers.list_customer_units_by_external_id(
      #     external_id: "customer_123",
      #     parent_external_id: "dept-rnd"
      #   )
      #
      # @return [Paid::Types::CustomerUnitListResponse]
      def list_customer_units_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["externalType"] = params[:external_type] if params.key?(:external_type)
        query_params["parentExternalId"] = params[:parent_external_id] if params.key?(:parent_external_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a unit for this customer. `externalId` is your own key for it: required, immutable, and unique within
      # the organization (no other customer's unit id, external id or alias may be the same, ignoring letter case);
      # every unit route addresses the unit by it, and `name` defaults to it. Omit `parentExternalId` to create the
      # customer's root unit (its first unit; `409 ROOT_EXISTS` if it already has one — a customer created with an
      # external id usable as a unit key already has its root, keyed by that external id, so name it as the parent
      # instead); otherwise the parent must exist (`409 PARENT_NOT_FOUND`) and be ACTIVE. A create whose `externalId` is
      # one of this customer's `DRAFT` units promotes the draft in place: same unit, same id, now ACTIVE with the
      # request's name, type, metadata and parent (`parentExternalId` is required; a draft sits under the root). A
      # signal that names a unit before it exists is accepted; with draft units enabled for your organization it creates
      # a `DRAFT` unit under the customer's root that holds the key, and creating the unit with that key later promotes
      # the draft; otherwise its spend attaches to the unit once you create it with that key. `409` also when the
      # externalId is taken on this customer (`CUSTOMER_UNIT_EXISTS`) or by another customer of the organization
      # (`EXTERNAL_ID_IN_USE`), the tree would get too deep, the customer is on seat-based billing, or a root unit is
      # sent with `billable: false` (`ROOT_UNIT_ALWAYS_BILLABLE`). `403 FEATURE_NOT_ENABLED` for `billable: false` when
      # non-billable units are not enabled for your organization. Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerUnitCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.customers.create_customer_unit_by_external_id(external_id: "team-research")
      #
      # @return [Paid::Types::CustomerUnit]
      def create_customer_unit_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units",
          body: Paid::Types::CustomerUnitCreate.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns one unit of this customer by its `externalId`, including a deleted one. `404` when the unit does not
      # exist or belongs to another customer. Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.get_customer_unit_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def get_customer_unit_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Soft-deletes a unit: it stays readable with `status: DELETED` and cannot be reactivated. Spend history that
      # references it is kept, and signals that keep naming it are still attributed to it. A `DRAFT` unit is deleted the
      # same way: it stays readable as DELETED, its key stays reserved, and spend already keyed to it stays its own.
      # `409` while the unit has ACTIVE or DRAFT children or a cap in force or scheduled; the root follows the same
      # rules, and once it is deleted a new root can be created. Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.delete_customer_unit_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def delete_customer_unit_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Renames, re-types, re-parents or annotates a unit, the root included. `externalId` cannot change. Re-parenting
      # (`parentExternalId`) moves the unit with everything under it. Spend already recorded keeps naming the unit it
      # landed on; caps are evaluated on the current tree, so from the move on the unit's spend in the running cap
      # period counts toward its new ancestors' caps and no longer toward the old ones. `billable` flips the unit's own
      # setting; moving a unit under a non-billable one makes it non-billable in effect (`effectiveBillable`). `409` for
      # a deleted unit (`CUSTOMER_UNIT_DELETED`), a draft (`CUSTOMER_UNIT_DRAFT`), a parent that does not exist or is
      # not ACTIVE, a move of the root (`ROOT_UNIT_IMMOVABLE`), `billable: false` on the root
      # (`ROOT_UNIT_ALWAYS_BILLABLE`), a move under the unit's own subtree, or a tree that would get too deep. `403
      # FEATURE_NOT_ENABLED` for `billable: false` when non-billable units are not enabled for your organization.
      # Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerUnitUpdate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.update_customer_unit_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def update_customer_unit_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          body: Paid::Types::CustomerUnitUpdate.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists the aliases that land signals on this unit. A customer-level alias (created on the customer routes) points
      # at the customer's root unit, so it is listed under the root. Addresses the customer by your external customer
      # id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.customers.list_customer_unit_aliases_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerAliasListResponse]
      def list_customer_unit_aliases_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAliasListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates an alias that lands signals on this unit: a signal whose `externalCustomerId` is the alias resolves to
      # this customer and, when it names no `customerUnit`, to this unit. The alias shares one set of ids with customer
      # external ids and unit ids, unique within the organization and ignoring letter case: an alias another customer
      # holds is refused with `409 EXTERNAL_ID_IN_USE`. Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAliasCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.create_customer_unit_alias_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "team-research",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::CustomerAlias]
      def create_customer_unit_alias_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases",
          body: Paid::Types::CustomerAliasCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAlias.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes an alias of this unit. Signals still sent with it then resolve to nothing again. Addresses the customer
      # by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      # @option params [String] :alias_
      #
      # @example
      #   client.customers.delete_customer_unit_alias_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "team-research",
      #     alias_: "tenant-7-sandbox"
      #   )
      #
      # @return [Paid::Customers::Types::DeleteCustomerUnitAliasByExternalIDResponse]
      def delete_customer_unit_alias_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases/#{URI.encode_uri_component(params[:alias_].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Customers::Types::DeleteCustomerUnitAliasByExternalIDResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists the customer's units as a flat list, newest last; assemble the tree from `parentExternalId` (`null` on the
      # root unit, `isRoot: true`). Deleted units are hidden unless `status=DELETED` is given, drafts unless
      # `status=DRAFT`. Filter by `externalType`, or by `parentExternalId` for one level of the tree. Use the value
      # returned as `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
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
      # @option params [Paid::Customers::Types::ListCustomerUnitsRequestStatus, nil] :status
      # @option params [String, nil] :external_type
      # @option params [String, nil] :parent_external_id
      #
      # @example
      #   client.customers.list_customer_units(
      #     id: "cus_abc123",
      #     parent_external_id: "dept-rnd"
      #   )
      #
      # @return [Paid::Types::CustomerUnitListResponse]
      def list_customer_units(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["externalType"] = params[:external_type] if params.key?(:external_type)
        query_params["parentExternalId"] = params[:parent_external_id] if params.key?(:parent_external_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a unit for this customer. `externalId` is your own key for it: required, immutable, and unique within
      # the organization (no other customer's unit id, external id or alias may be the same, ignoring letter case);
      # every unit route addresses the unit by it, and `name` defaults to it. Omit `parentExternalId` to create the
      # customer's root unit (its first unit; `409 ROOT_EXISTS` if it already has one — a customer created with an
      # external id usable as a unit key already has its root, keyed by that external id, so name it as the parent
      # instead); otherwise the parent must exist (`409 PARENT_NOT_FOUND`) and be ACTIVE. A create whose `externalId` is
      # one of this customer's `DRAFT` units promotes the draft in place: same unit, same id, now ACTIVE with the
      # request's name, type, metadata and parent (`parentExternalId` is required; a draft sits under the root). A
      # signal that names a unit before it exists is accepted; with draft units enabled for your organization it creates
      # a `DRAFT` unit under the customer's root that holds the key, and creating the unit with that key later promotes
      # the draft; otherwise its spend attaches to the unit once you create it with that key. `409` also when the
      # externalId is taken on this customer (`CUSTOMER_UNIT_EXISTS`) or by another customer of the organization
      # (`EXTERNAL_ID_IN_USE`), the tree would get too deep, the customer is on seat-based billing, or a root unit is
      # sent with `billable: false` (`ROOT_UNIT_ALWAYS_BILLABLE`). `403 FEATURE_NOT_ENABLED` for `billable: false` when
      # non-billable units are not enabled for your organization. Use the value returned as `customer.id`, for example
      # `cus_abc123`; if you have your own customer ID, use the `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerUnitCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.customers.create_customer_unit(
      #     id: "cus_abc123",
      #     external_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def create_customer_unit(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units",
          body: Paid::Types::CustomerUnitCreate.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns one unit of this customer by its `externalId`, including a deleted one. `404` when the unit does not
      # exist or belongs to another customer. Use the value returned as `customer.id`, for example `cus_abc123`; if you
      # have your own customer ID, use the `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.get_customer_unit(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def get_customer_unit(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Soft-deletes a unit: it stays readable with `status: DELETED` and cannot be reactivated. Spend history that
      # references it is kept, and signals that keep naming it are still attributed to it. A `DRAFT` unit is deleted the
      # same way: it stays readable as DELETED, its key stays reserved, and spend already keyed to it stays its own.
      # `409` while the unit has ACTIVE or DRAFT children or a cap in force or scheduled; the root follows the same
      # rules, and once it is deleted a new root can be created. Use the value returned as `customer.id`, for example
      # `cus_abc123`; if you have your own customer ID, use the `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.delete_customer_unit(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def delete_customer_unit(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Renames, re-types, re-parents or annotates a unit, the root included. `externalId` cannot change. Re-parenting
      # (`parentExternalId`) moves the unit with everything under it. Spend already recorded keeps naming the unit it
      # landed on; caps are evaluated on the current tree, so from the move on the unit's spend in the running cap
      # period counts toward its new ancestors' caps and no longer toward the old ones. `billable` flips the unit's own
      # setting; moving a unit under a non-billable one makes it non-billable in effect (`effectiveBillable`). `409` for
      # a deleted unit (`CUSTOMER_UNIT_DELETED`), a draft (`CUSTOMER_UNIT_DRAFT`), a parent that does not exist or is
      # not ACTIVE, a move of the root (`ROOT_UNIT_IMMOVABLE`), `billable: false` on the root
      # (`ROOT_UNIT_ALWAYS_BILLABLE`), a move under the unit's own subtree, or a tree that would get too deep. `403
      # FEATURE_NOT_ENABLED` for `billable: false` when non-billable units are not enabled for your organization. Use
      # the value returned as `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerUnitUpdate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.update_customer_unit(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerUnit]
      def update_customer_unit(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          body: Paid::Types::CustomerUnitUpdate.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnit.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists the aliases that land signals on this unit. A customer-level alias (created on the customer routes) points
      # at the customer's root unit, so it is listed under the root. Use the value returned as `customer.id`, for
      # example `cus_abc123`; if you have your own customer ID, use the `/api/v2/customers/external/{externalId}/…`
      # twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.customers.list_customer_unit_aliases(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "team-research"
      #   )
      #
      # @return [Paid::Types::CustomerAliasListResponse]
      def list_customer_unit_aliases(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAliasListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates an alias that lands signals on this unit: a signal whose `externalCustomerId` is the alias resolves to
      # this customer and, when it names no `customerUnit`, to this unit. The alias shares one set of ids with customer
      # external ids and unit ids, unique within the organization and ignoring letter case: an alias another customer
      # holds is refused with `409 EXTERNAL_ID_IN_USE`. Use the value returned as `customer.id`, for example
      # `cus_abc123`; if you have your own customer ID, use the `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAliasCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.create_customer_unit_alias(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "team-research",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::CustomerAlias]
      def create_customer_unit_alias(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases",
          body: Paid::Types::CustomerAliasCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAlias.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes an alias of this unit. Signals still sent with it then resolve to nothing again. Use the value returned
      # as `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      # @option params [String] :alias_
      #
      # @example
      #   client.customers.delete_customer_unit_alias(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "team-research",
      #     alias_: "tenant-7-sandbox"
      #   )
      #
      # @return [Paid::Customers::Types::DeleteCustomerUnitAliasResponse]
      def delete_customer_unit_alias(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases/#{URI.encode_uri_component(params[:alias_].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Customers::Types::DeleteCustomerUnitAliasResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a unit by its key without naming its customer. The answer carries the customer's ids (`customerId`,
      # `customerExternalId`) so the customer routes are one hop away, but, like the create on this path, not Paid's
      # unit id: a caller of these routes names units by key. The key is looked up across the organization ignoring
      # letter case. When more than one unit carries it in another letter case (legacy duplicates across customers, or
      # case variants on one customer), the exact spelling decides; when that does not single one out either, the answer
      # is `409 CUSTOMER_UNIT_AMBIGUOUS`: use the customer's unit routes, where the key is exact.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.get_customer_unit_by_key(external_customer_unit_id: "team-research")
      #
      # @return [Paid::Types::CustomerUnitByKey]
      def get_customer_unit_by_key(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customer-units/external/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitByKey.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists the aliases that land signals on this unit, without naming its customer. The key is looked up across the
      # organization ignoring letter case. When more than one unit carries it in another letter case (legacy duplicates
      # across customers, or case variants on one customer), the exact spelling decides; when that does not single one
      # out either, the answer is `409 CUSTOMER_UNIT_AMBIGUOUS`: use the customer's unit routes, where the key is exact.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_customer_unit_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.customers.list_customer_unit_aliases_by_key(external_customer_unit_id: "team-research")
      #
      # @return [Paid::Types::CustomerAliasListResponse]
      def list_customer_unit_aliases_by_key(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customer-units/external/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAliasListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates an alias that lands signals on this unit, without naming its customer: a signal whose
      # `externalCustomerId` is the alias resolves to the unit's customer and is attributed to this unit. The alias must
      # be unique within the organization ignoring letter case (`409 EXTERNAL_ID_IN_USE`). The key is looked up across
      # the organization ignoring letter case. When more than one unit carries it in another letter case (legacy
      # duplicates across customers, or case variants on one customer), the exact spelling decides; when that does not
      # single one out either, the answer is `409 CUSTOMER_UNIT_AMBIGUOUS`: use the customer's unit routes, where the
      # key is exact.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAliasCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.create_customer_unit_alias_by_key(
      #     external_customer_unit_id: "team-research",
      #     alias_: "child-customer-1"
      #   )
      #
      # @return [Paid::Types::CustomerAlias]
      def create_customer_unit_alias_by_key(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customer-units/external/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases",
          body: Paid::Types::CustomerAliasCreateRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAlias.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes an alias of this unit, without naming its customer. Signals still sent with it then resolve to nothing
      # again. The key is looked up across the organization ignoring letter case. When more than one unit carries it in
      # another letter case (legacy duplicates across customers, or case variants on one customer), the exact spelling
      # decides; when that does not single one out either, the answer is `409 CUSTOMER_UNIT_AMBIGUOUS`: use the
      # customer's unit routes, where the key is exact.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_customer_unit_id
      # @option params [String] :alias_
      #
      # @example
      #   client.customers.delete_customer_unit_alias_by_key(
      #     external_customer_unit_id: "team-research",
      #     alias_: "tenant-7"
      #   )
      #
      # @return [Paid::Customers::Types::DeleteCustomerUnitAliasByKeyResponse]
      def delete_customer_unit_alias_by_key(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customer-units/external/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/aliases/#{URI.encode_uri_component(params[:alias_].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Customers::Types::DeleteCustomerUnitAliasByKeyResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a unit by naming its parent alone; the customer is whoever the parent belongs to, so a caller that only
      # knows its own ids never needs the customer routes. `parentExternalId` is looked up across the organization,
      # ignoring letter case, among unit ids, customer external ids and aliases: a unit becomes the parent; a customer
      # (by external id or alias) stands for the top of its tree, so the new unit goes under the root unit, or becomes
      # the root when the customer has none. The parent is only ever named by your id, never by a Paid id, so a customer
      # with no external id takes its units through the customer's unit routes. The answer carries the unit's
      # `externalId` and its customer's ids, not Paid's unit id. `externalId` follows the same rules as on the
      # customer-scoped create: required, immutable, unique within the organization ignoring letter case. `409
      # PARENT_NOT_FOUND` when nothing matches, `PARENT_NOT_ACTIVE` for a deleted or draft parent, `PARENT_AMBIGUOUS`
      # when legacy rows let the id name more than one customer (use that customer's unit routes), `PARENT_CHANGED` when
      # the reference pointed elsewhere by the time the create ran (send it again), and otherwise the customer-scoped
      # create's 409s (`CUSTOMER_UNIT_EXISTS`, `EXTERNAL_ID_IN_USE`, `DEPTH_EXCEEDED`, `SEAT_BILLING`, and
      # `ROOT_UNIT_ALWAYS_BILLABLE` for `billable: false` on a unit that would become the root). `403
      # FEATURE_NOT_ENABLED` for `billable: false` when non-billable units are not enabled for your organization.
      #
      # @param request_options [Hash]
      # @param params [Paid::Customers::Types::CustomerUnitCreateUnderParent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.customers.create_customer_unit_under_parent(
      #     external_id: "team-research",
      #     parent_external_id: "dept-rnd"
      #   )
      #
      # @return [Paid::Types::CustomerUnitCreatedUnderParent]
      def create_customer_unit_under_parent(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customer-units/",
          body: Paid::Customers::Types::CustomerUnitCreateUnderParent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCreatedUnderParent.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists this customer's API keys, newest first and paginated, revoked and expired ones included. The secret is
      # never returned; `keyPrefix` and `last4` identify each key. Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @example
      #   client.customers.list_customer_api_keys_by_external_id(external_id: "customer_123")
      #
      # @return [Paid::Types::CustomerAPIKeyList]
      def list_customer_api_keys_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/api-keys",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAPIKeyList.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates an API key bound to this customer. The response carries the secret in `key`, returned only this once:
      # store it immediately, as Paid keeps only its hash. The key acts for this customer alone: it can send signals for
      # this customer through `POST /api/v2/signals/bulk`, and every other route refuses it. Requires `write:api-keys`,
      # which full-access keys hold; a restricted key needs the scope granted explicitly. Addresses the customer by your
      # external customer id.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAPIKeyCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      #
      # @example
      #   client.customers.create_customer_api_key_by_external_id(
      #     external_id: "customer_123",
      #     name: "Tenant runtime (production)"
      #   )
      #
      # @return [Paid::Types::CustomerAPIKeyCreated]
      def create_customer_api_key_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/api-keys",
          body: Paid::Types::CustomerAPIKeyCreate.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAPIKeyCreated.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Revokes one of this customer's keys, which then stops authenticating. Keys are never deleted: a revoked key
      # stays listed with `revokedAt` set, and deleting the customer revokes its keys too. Revoking an already revoked
      # key returns it unchanged. `404` when the key does not belong to this customer. Addresses the customer by your
      # external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :api_key_id
      #
      # @example
      #   client.customers.revoke_customer_api_key_by_external_id(
      #     external_id: "customer_123",
      #     api_key_id: "apiKeyId"
      #   )
      #
      # @return [Paid::Types::CustomerAPIKey]
      def revoke_customer_api_key_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/api-keys/#{URI.encode_uri_component(params[:api_key_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAPIKey.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists this customer's API keys, newest first and paginated, revoked and expired ones included. The secret is
      # never returned; `keyPrefix` and `last4` identify each key. Use the value returned as `customer.id`, for example
      # `cus_abc123`; if you have your own customer ID, use the `/api/v2/customers/external/{externalId}/…` twin.
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
      #   client.customers.list_customer_api_keys(id: "cus_abc123")
      #
      # @return [Paid::Types::CustomerAPIKeyList]
      def list_customer_api_keys(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/api-keys",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAPIKeyList.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates an API key bound to this customer. The response carries the secret in `key`, returned only this once:
      # store it immediately, as Paid keeps only its hash. The key acts for this customer alone: it can send signals for
      # this customer through `POST /api/v2/signals/bulk`, and every other route refuses it. Requires `write:api-keys`,
      # which full-access keys hold; a restricted key needs the scope granted explicitly. Use the value returned as
      # `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerAPIKeyCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.customers.create_customer_api_key(
      #     id: "cus_abc123",
      #     name: "Tenant runtime (production)"
      #   )
      #
      # @return [Paid::Types::CustomerAPIKeyCreated]
      def create_customer_api_key(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/api-keys",
          body: Paid::Types::CustomerAPIKeyCreate.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAPIKeyCreated.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Revokes one of this customer's keys, which then stops authenticating. Keys are never deleted: a revoked key
      # stays listed with `revokedAt` set, and deleting the customer revokes its keys too. Revoking an already revoked
      # key returns it unchanged. `404` when the key does not belong to this customer. Use the value returned as
      # `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :api_key_id
      #
      # @example
      #   client.customers.revoke_customer_api_key(
      #     id: "cus_abc123",
      #     api_key_id: "apiKeyId"
      #   )
      #
      # @return [Paid::Types::CustomerAPIKey]
      def revoke_customer_api_key(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/api-keys/#{URI.encode_uri_component(params[:api_key_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerAPIKey.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the cap in force on this customer unit for one credits currency, with usage in the current period when
      # available. Select the currency with `creditsCurrencyId`; it may be omitted only when the organization has
      # exactly one credits currency, which is then used and echoed back. `404` when the customer or the unit does not
      # exist, or the unit has no cap in force for that currency. The usage figures are advisory: other spend may land
      # between this read and the next burn. Addresses the customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      # @option params [String, nil] :credits_currency_id
      #
      # @example
      #   client.customers.get_customer_unit_cap_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "tenant-a",
      #     credits_currency_id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf"
      #   )
      #
      # @return [Paid::Types::CustomerUnitCapResponse]
      def get_customer_unit_cap_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/cap",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCapResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Sets the cap on this customer unit for one credits currency. Returns `changed: false` without creating a version
      # when the effective timeline is unchanged; otherwise records a new version, preserving earlier rows. The newest
      # version wins where they overlap. `effectiveFrom` controls applicability; `schedule` defines monthly UTC
      # boundaries independently. Omit schedule to inherit the version covering effectiveFrom, or use the creation-time
      # UTC day if none applies. Select the currency with `creditsCurrencyId` in the body; it may be omitted only when
      # the organization has exactly one credits currency. A cap covers the unit and every unit beneath it, so a cap on
      # the customer's root unit covers every unit of that customer; spend from a signal that names no unit counts
      # toward no cap. `404` when the customer or the unit does not exist. `409` for customers on seat-based billing, a
      # deleted unit (`CUSTOMER_UNIT_DELETED`) or a draft (`CUSTOMER_UNIT_DRAFT`). Addresses the customer by your
      # external customer id.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerUnitCapSet]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.set_customer_unit_cap_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "tenant-a",
      #     amount: 10000
      #   )
      #
      # @return [Paid::Types::CustomerUnitCapSetResponse]
      def set_customer_unit_cap_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[external_id external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/cap",
          body: Paid::Types::CustomerUnitCapSet.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCapSetResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Ends the cap on this customer unit for one credits currency by setting `effectiveUntil` to now on every open
      # version — the one in force, older overlapping versions still open, and versions scheduled to start later — so
      # nothing can resurface or activate afterwards; nothing is deleted and history is kept. Select the currency with
      # `creditsCurrencyId`; it may be omitted only when the organization has exactly one credits currency. `404` when
      # the customer or the unit does not exist, or there is no open version for that currency. Addresses the customer
      # by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      # @option params [String, nil] :credits_currency_id
      #
      # @example
      #   client.customers.end_customer_unit_cap_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "tenant-a",
      #     credits_currency_id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf"
      #   )
      #
      # @return [Paid::Types::CustomerUnitCapEndResponse]
      def end_customer_unit_cap_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/cap",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCapEndResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the credits of one credits currency spent by this customer unit and every unit beneath it during a
      # window, whether or not the unit has a cap. The window runs from `start` (inclusive) to `end` (exclusive), at
      # most 366 days; omit both for the current calendar month (UTC). For a capped unit over its cap's current period,
      # `spent` equals the cap's `used`. Spend from a signal that names no unit counts toward no unit. Select the
      # currency with `creditsCurrencyId`; it may be omitted only when the organization has exactly one credits
      # currency, which is then used and echoed back. `404` when the customer or the unit does not exist. Addresses the
      # customer by your external customer id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :external_id
      # @option params [String] :external_customer_unit_id
      # @option params [String, nil] :credits_currency_id
      # @option params [String, nil] :start
      # @option params [String, nil] :end_
      #
      # @example
      #   client.customers.get_customer_unit_spend_by_external_id(
      #     external_id: "customer_123",
      #     external_customer_unit_id: "tenant-a",
      #     credits_currency_id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf",
      #     start: "2026-10-01T00:00:00Z",
      #     end_: "2026-11-01T00:00:00Z"
      #   )
      #
      # @return [Paid::Types::CustomerUnitSpendResponse]
      def get_customer_unit_spend_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)
        query_params["start"] = params[:start] if params.key?(:start)
        query_params["end"] = params[:end_] if params.key?(:end_)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/external/#{URI.encode_uri_component(params[:external_id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/spend",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitSpendResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the cap in force on this customer unit for one credits currency, with usage in the current period when
      # available. Select the currency with `creditsCurrencyId`; it may be omitted only when the organization has
      # exactly one credits currency, which is then used and echoed back. `404` when the customer or the unit does not
      # exist, or the unit has no cap in force for that currency. The usage figures are advisory: other spend may land
      # between this read and the next burn. Use the value returned as `customer.id`, for example `cus_abc123`; if you
      # have your own customer ID, use the `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      # @option params [String, nil] :credits_currency_id
      #
      # @example
      #   client.customers.get_customer_unit_cap(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "tenant-a",
      #     credits_currency_id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf"
      #   )
      #
      # @return [Paid::Types::CustomerUnitCapResponse]
      def get_customer_unit_cap(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/cap",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCapResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Sets the cap on this customer unit for one credits currency. Returns `changed: false` without creating a version
      # when the effective timeline is unchanged; otherwise records a new version, preserving earlier rows. The newest
      # version wins where they overlap. `effectiveFrom` controls applicability; `schedule` defines monthly UTC
      # boundaries independently. Omit schedule to inherit the version covering effectiveFrom, or use the creation-time
      # UTC day if none applies. Select the currency with `creditsCurrencyId` in the body; it may be omitted only when
      # the organization has exactly one credits currency. A cap covers the unit and every unit beneath it, so a cap on
      # the customer's root unit covers every unit of that customer; spend from a signal that names no unit counts
      # toward no cap. `404` when the customer or the unit does not exist. `409` for customers on seat-based billing, a
      # deleted unit (`CUSTOMER_UNIT_DELETED`) or a draft (`CUSTOMER_UNIT_DRAFT`). Use the value returned as
      # `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::CustomerUnitCapSet]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      #
      # @example
      #   client.customers.set_customer_unit_cap(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "tenant-a",
      #     amount: 10000
      #   )
      #
      # @return [Paid::Types::CustomerUnitCapSetResponse]
      def set_customer_unit_cap(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id external_customer_unit_id]
        body_params = params.except(*path_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/cap",
          body: Paid::Types::CustomerUnitCapSet.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCapSetResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Ends the cap on this customer unit for one credits currency by setting `effectiveUntil` to now on every open
      # version — the one in force, older overlapping versions still open, and versions scheduled to start later — so
      # nothing can resurface or activate afterwards; nothing is deleted and history is kept. Select the currency with
      # `creditsCurrencyId`; it may be omitted only when the organization has exactly one credits currency. `404` when
      # the customer or the unit does not exist, or there is no open version for that currency. Use the value returned
      # as `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      # @option params [String, nil] :credits_currency_id
      #
      # @example
      #   client.customers.end_customer_unit_cap(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "tenant-a",
      #     credits_currency_id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf"
      #   )
      #
      # @return [Paid::Types::CustomerUnitCapEndResponse]
      def end_customer_unit_cap(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/cap",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitCapEndResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the credits of one credits currency spent by this customer unit and every unit beneath it during a
      # window, whether or not the unit has a cap. The window runs from `start` (inclusive) to `end` (exclusive), at
      # most 366 days; omit both for the current calendar month (UTC). For a capped unit over its cap's current period,
      # `spent` equals the cap's `used`. Spend from a signal that names no unit counts toward no unit. Select the
      # currency with `creditsCurrencyId`; it may be omitted only when the organization has exactly one credits
      # currency, which is then used and echoed back. `404` when the customer or the unit does not exist. Use the value
      # returned as `customer.id`, for example `cus_abc123`; if you have your own customer ID, use the
      # `/api/v2/customers/external/{externalId}/…` twin.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :external_customer_unit_id
      # @option params [String, nil] :credits_currency_id
      # @option params [String, nil] :start
      # @option params [String, nil] :end_
      #
      # @example
      #   client.customers.get_customer_unit_spend(
      #     id: "cus_abc123",
      #     external_customer_unit_id: "tenant-a",
      #     credits_currency_id: "7f4f5d4c-55e9-4d5b-a3e7-c9eb3d2d01bf",
      #     start: "2026-10-01T00:00:00Z",
      #     end_: "2026-11-01T00:00:00Z"
      #   )
      #
      # @return [Paid::Types::CustomerUnitSpendResponse]
      def get_customer_unit_spend(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["creditsCurrencyId"] = params[:credits_currency_id] if params.key?(:credits_currency_id)
        query_params["start"] = params[:start] if params.key?(:start)
        query_params["end"] = params[:end_] if params.key?(:end_)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "customers/#{URI.encode_uri_component(params[:id].to_s)}/customer-units/#{URI.encode_uri_component(params[:external_customer_unit_id].to_s)}/spend",
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
          (response.body.to_s.empty? ? nil : Paid::Types::CustomerUnitSpendResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
