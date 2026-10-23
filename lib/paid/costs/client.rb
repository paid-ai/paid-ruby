# frozen_string_literal: true

module Paid
  module Costs
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Ingests a batch of cost records. Each record is either a pre-computed `cost` (caller supplies amount + currency)
      # or a `usage` record (caller supplies vendor/model/token counts and Paid prices it server-side). The batch is
      # all-or-nothing: if any record fails validation, the entire request is rejected with a 400 and nothing is
      # persisted.
      #
      # @param request_options [Hash]
      # @param params [Paid::Costs::Types::CostIngestRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.costs.create_costs(costs: [])
      #
      # @return [Paid::Types::CostIngestResponse]
      def create_costs(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "costs/bulk",
          body: Paid::Costs::Types::CostIngestRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CostIngestResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
