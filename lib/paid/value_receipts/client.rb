# frozen_string_literal: true

module Paid
  module ValueReceipts
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List value receipts for the organization
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
      # @option params [String, nil] :order_id
      # @option params [String, nil] :product_id
      # @option params [Paid::ValueReceipts::Types::ListValueReceiptsRequestArchived, nil] :archived
      #
      # @example
      #   client.value_receipts.list_value_receipts
      #
      # @return [Paid::Types::ValueReceiptListResponse]
      def list_value_receipts(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["externalCustomerId"] = params[:external_customer_id] if params.key?(:external_customer_id)
        query_params["orderId"] = params[:order_id] if params.key?(:order_id)
        query_params["productId"] = params[:product_id] if params.key?(:product_id)
        query_params["archived"] = params[:archived] if params.key?(:archived)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-receipts/",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a value receipt for a customer and date range, optionally scoped to a product or an order. Every call
      # creates a receipt, so calling twice for the same period gives the customer two. The date range must have ended;
      # a range with nothing delivered in it reports zero. Returns the receipt's ID and public URL.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::SyncValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.value_receipts.create_value_receipt(
      #     start_date: "2024-01-15T09:30:00Z",
      #     end_date: "2024-01-15T09:30:00Z"
      #   )
      #
      # @return [Paid::Types::ValueReceiptSyncResponse]
      def create_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/",
          body: Paid::Types::SyncValueReceiptRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptSyncResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated — use POST /value-receipts. Returns the receipt this customer already has for the date range (200),
      # and creates one only if there is none (201), so calling twice does not give the customer two receipts. A receipt
      # does not change after it is created, so a repeated call reports the same figures. Create a new receipt to report
      # the period again with newer data.
      #
      # @param request_options [Hash]
      # @param params [Paid::Types::SyncValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.value_receipts.sync_value_receipt(
      #     start_date: "2024-01-15T09:30:00Z",
      #     end_date: "2024-01-15T09:30:00Z"
      #   )
      #
      # @return [Paid::Types::ValueReceiptSyncResponse]
      def sync_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/sync",
          body: Paid::Types::SyncValueReceiptRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptSyncResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a value receipt by ID, including its publish/share state.
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
      #   client.value_receipts.get_value_receipt_by_id(id: "id")
      #
      # @return [Paid::Types::ValueReceiptDetail]
      def get_value_receipt_by_id(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated. A value receipt is immutable from creation, so it cannot be re-populated. A receipt you own answers
      # 409, and one that does not exist or belongs to another organization answers 404. To get current data, create a
      # new receipt for the period with `POST /value-receipts`.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueReceipts::Types::RefreshValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.value_receipts.refresh_value_receipt(id: "id")
      #
      # @return [Paid::Types::ValueReceiptSyncResponse]
      def refresh_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueReceipts::Types::RefreshValueReceiptRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}/refresh",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptSyncResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated. A value receipt is immutable from creation, so it is already sealed and this call has nothing to do.
      # It answers 200 for any receipt the organization owns.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueReceipts::Types::SealValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.value_receipts.seal_value_receipt(id: "id")
      #
      # @return [Paid::Types::SuccessResponse]
      def seal_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueReceipts::Types::SealValueReceiptRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}/seal",
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
          (response.body.to_s.empty? ? nil : Paid::Types::SuccessResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Soft-archive a value receipt. Archived VRs are hidden from list by default.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueReceipts::Types::ArchiveValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.value_receipts.archive_value_receipt(id: "id")
      #
      # @return [Paid::Types::SuccessResponse]
      def archive_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueReceipts::Types::ArchiveValueReceiptRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}/archive",
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
          (response.body.to_s.empty? ? nil : Paid::Types::SuccessResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Restore an archived value receipt. A receipt with no content, or one that failed to build, stays archived and
      # answers 409. So does one whose period another value receipt now covers.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueReceipts::Types::UnarchiveValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.value_receipts.unarchive_value_receipt(id: "id")
      #
      # @return [Paid::Types::SuccessResponse]
      def unarchive_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueReceipts::Types::UnarchiveValueReceiptRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}/unarchive",
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
          (response.body.to_s.empty? ? nil : Paid::Types::SuccessResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Make a value receipt publicly accessible via URL. An archived receipt is rejected with 409 — unarchive it first.
      # So is one with no content, which has nothing to show.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueReceipts::Types::PublishValueReceiptBody]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.value_receipts.publish_value_receipt(id: "id")
      #
      # @return [Paid::Types::ValueReceiptDetail]
      def publish_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueReceipts::Types::PublishValueReceiptBody.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}/publish",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Revoke public access to a value receipt. Available for archived receipts too, so a live link can always be
      # revoked.
      #
      # @param request_options [Hash]
      # @param params [Paid::ValueReceipts::Types::UnpublishValueReceiptRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.value_receipts.unpublish_value_receipt(id: "id")
      #
      # @return [Paid::Types::ValueReceiptDetail]
      def unpublish_value_receipt(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::ValueReceipts::Types::UnpublishValueReceiptRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "value-receipts/#{URI.encode_uri_component(params[:id].to_s)}/unpublish",
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
          (response.body.to_s.empty? ? nil : Paid::Types::ValueReceiptDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
