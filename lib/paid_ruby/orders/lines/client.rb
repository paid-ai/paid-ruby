# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/order_line_create"
require_relative "../../types/order"
require "async"
require_relative "../../../requests"

module Paid
  module Orders
    class LinesClient
    # @return [Paid::RequestClient] 
      attr_reader :request_client


      # @param request_client [Paid::RequestClient] 
      # @return [Paid::Orders::LinesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param order_id [String] 
      # @param lines [Array<Hash>] Request of type Array<Paid::OrderLineCreate>, as a Hash
      #   * :agent_id (String) 
      #   * :agent_external_id (String) 
      #   * :name (String) 
      #   * :description (String) 
      # @param request_options [Paid::RequestOptions] 
      # @return [Paid::Order]
      # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.lines.update(order_id: "orderId", lines: [{ agent_external_id: "acme-agent", name: "Order Line One", description: "Order Line One is an order line for Acme, Inc." }, { agent_external_id: "acme-agent-2", name: "Order Line Two", description: "Order Line Two is an order line for Acme, Inc." }])
      def update(order_id:, lines: nil, request_options: nil)
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), lines: lines }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}/lines"
end
        Paid::Order.from_json(json_object: response.body)
      end
    end
    class AsyncLinesClient
    # @return [Paid::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Paid::RequestClient] 
      # @return [Paid::Orders::AsyncLinesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param order_id [String] 
      # @param lines [Array<Hash>] Request of type Array<Paid::OrderLineCreate>, as a Hash
      #   * :agent_id (String) 
      #   * :agent_external_id (String) 
      #   * :name (String) 
      #   * :description (String) 
      # @param request_options [Paid::RequestOptions] 
      # @return [Paid::Order]
      # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.lines.update(order_id: "orderId", lines: [{ agent_external_id: "acme-agent", name: "Order Line One", description: "Order Line One is an order line for Acme, Inc." }, { agent_external_id: "acme-agent-2", name: "Order Line Two", description: "Order Line Two is an order line for Acme, Inc." }])
      def update(order_id:, lines: nil, request_options: nil)
        Async do
          response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), lines: lines }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}/lines"
end
          Paid::Order.from_json(json_object: response.body)
        end
      end
    end
  end
end