# frozen_string_literal: true

module Paid
  module Orders
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get a list of orders for the organization
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
      # @option params [String, nil] :external_id
      # @option params [Paid::Orders::Types::ListOrdersRequestCreationState, nil] :creation_state
      # @option params [Paid::Orders::Types::OrderStatusFilter, nil] :status
      # @option params [String, nil] :start_date_from
      # @option params [String, nil] :start_date_to
      # @option params [String, nil] :end_date_from
      # @option params [String, nil] :end_date_to
      #
      # @example
      #   client.orders.list_orders
      #
      # @return [Paid::Types::OrderListResponse]
      def list_orders(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["externalId"] = params[:external_id] if params.key?(:external_id)
        query_params["creationState"] = params[:creation_state] if params.key?(:creation_state)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["startDateFrom"] = params[:start_date_from] if params.key?(:start_date_from)
        query_params["startDateTo"] = params[:start_date_to] if params.key?(:start_date_to)
        query_params["endDateFrom"] = params[:end_date_from] if params.key?(:end_date_from)
        query_params["endDateTo"] = params[:end_date_to] if params.key?(:end_date_to)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "orders/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::OrderListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new order for the organization
      #
      # @param request_options [Hash]
      # @param params [Paid::Orders::Types::CreateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.orders.create_order(customer_id: "customerId")
      #
      # @return [Paid::Types::Order]
      def create_order(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "orders/",
          body: Paid::Orders::Types::CreateOrderRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Order.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get an order by ID
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
      #   client.orders.get_order_by_id(id: "id")
      #
      # @return [Paid::Types::Order]
      def get_order_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Order.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update an order by ID. creationState must equal the order's current state; activate a draft order with POST
      # /orders/{id}/activate.
      #
      # @param request_options [Hash]
      # @param params [Paid::Orders::Types::UpdateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.orders.update_order_by_id(id: "id")
      #
      # @return [Paid::Types::Order]
      def update_order_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Orders::Types::UpdateOrderRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::Order.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete an order by ID
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
      #   client.orders.delete_order_by_id(id: "id")
      #
      # @return [Paid::Types::EmptyResponse]
      def delete_order_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}",
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

      # Activate a draft order by ID. Activation starts billing for the order using the same validation and side effects
      # as the dashboard activation flow.
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
      #   client.orders.activate_order_by_id(id: "id")
      #
      # @return [Paid::Types::Order]
      def activate_order_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}/activate",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::Order.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get the order lines for an order by ID
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
      #   client.orders.get_order_lines(id: "id")
      #
      # @return [Paid::Types::OrderLinesResponse]
      def get_order_lines(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}/lines",
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
          (response.body.to_s.empty? ? nil : Paid::Types::OrderLinesResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List seats for an order
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
      # @option params [String, nil] :product_external_id
      # @option params [Paid::Orders::Types::ListOrderSeatsRequestStatus, nil] :status
      #
      # @example
      #   client.orders.list_order_seats(id: "id")
      #
      # @return [Paid::Types::OrderSeatListResponse]
      def list_order_seats(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["productExternalId"] = params[:product_external_id] if params.key?(:product_external_id)
        query_params["status"] = params[:status] if params.key?(:status)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}/seats",
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
          (response.body.to_s.empty? ? nil : Paid::Types::OrderSeatListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Assign or unassign a single seat on an order
      #
      # @param request_options [Hash]
      # @param params [Paid::Orders::Types::UpdateSeatAssignmentRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :seat_id
      #
      # @example
      #   client.orders.update_order_seat_assignment(
      #     id: "id",
      #     seat_id: "seatId"
      #   )
      #
      # @return [Paid::Types::OrderSeat]
      def update_order_seat_assignment(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Orders::Types::UpdateSeatAssignmentRequest.new(params).to_h
        non_body_param_names = %w[id seatId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}/seats/#{URI.encode_uri_component(params[:seat_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Paid::Types::OrderSeat.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Assign or unassign seats in batch for an order
      #
      # @param request_options [Hash]
      # @param params [Paid::Orders::Types::BatchSeatAssignmentsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.orders.batch_order_seat_assignments(
      #     id: "id",
      #     assignments: [{
      #       seatId: "seatId"
      #     }]
      #   )
      #
      # @return [Paid::Types::BatchSeatAssignmentsResponse]
      def batch_order_seat_assignments(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Orders::Types::BatchSeatAssignmentsRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "orders/#{URI.encode_uri_component(params[:id].to_s)}/seat-assignments",
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
          (response.body.to_s.empty? ? nil : Paid::Types::BatchSeatAssignmentsResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates or updates a customer, an optional contact, the products on the order, and the order with its lines, in
      # one call. Each record is matched by its `externalId`, so you can send the same deal again after it changes in
      # your CRM. Returns 201 Created when the order is new, and 200 OK when an existing draft order with the same
      # `externalId` was updated. Treat both as success. Re-provisioning an order that is already active returns 409
      # `ORDER_ALREADY_ACTIVE`; change an active order through the amendments API instead. Amounts are whole numbers in
      # minor currency units (cents).
      #
      # @param request_options [Hash]
      # @param params [Paid::Orders::Types::ProvisionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :idempotency_key
      #
      # @example
      #   client.orders.upsert_order_by_external_id(
      #     idempotency_key: "deal_88213-2026-09-30T14:05:00Z",
      #     external_reference: {
      #       source: "standard",
      #       metadata: {
      #         crmDealId: "deal_88213",
      #         crmAccountId: "acct_4410"
      #       }
      #     },
      #     customer: {
      #       externalId: "acct_4410",
      #       name: "Northwind Logistics",
      #       email: "billing@northwind.example",
      #       billingAddress: {
      #         line1: "200 Harbor Way",
      #         city: "Seattle",
      #         state: "WA",
      #         zipCode: "98101",
      #         country: "US"
      #       }
      #     },
      #     order: {
      #       externalId: "deal_88213",
      #       name: "Northwind Logistics - Growth plan",
      #       currency: "USD",
      #       startDate: "2026-10-01T00:00:00.000Z",
      #       lines: [{
      #         externalId: "deal_88213_platform",
      #         startDate: "2026-10-01T00:00:00.000Z",
      #         product: {
      #           externalId: "growth_plan",
      #           name: "Growth plan",
      #           attributes: [{
      #             name: "Platform fee",
      #             pricing: {
      #               chargeType: "recurring",
      #               pricingModel: "perUnit",
      #               billingFrequency: "monthly",
      #               billingType: "advance",
      #               pricePoints: {
      #                 currency: "USD",
      #                 unitPrice: 49900
      #               }
      #             }
      #           }]
      #         }
      #       }, {
      #         externalId: "deal_88213_launch_discount",
      #         lineType: "CREDIT",
      #         startDate: "2026-10-01T00:00:00.000Z",
      #         endDate: "2027-01-01T00:00:00.000Z",
      #         product: {
      #           externalId: "launch_discount",
      #           name: "Launch discount",
      #           attributes: [{
      #             name: "Launch discount",
      #             pricing: {
      #               chargeType: "recurring",
      #               pricingModel: "perUnit",
      #               billingFrequency: "monthly",
      #               billingType: "advance",
      #               pricePoints: {
      #                 currency: "USD",
      #                 unitPrice: 10000
      #               }
      #             }
      #           }]
      #         }
      #       }]
      #     }
      #   )
      #
      # @return [Paid::Types::ProvisionResponse]
      def upsert_order_by_external_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::Orders::Types::ProvisionRequest.new(params).to_h
        non_body_param_names = %w[idempotency-key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["idempotency-key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "provision/",
          headers: headers,
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
          (response.body.to_s.empty? ? nil : Paid::Types::ProvisionResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
