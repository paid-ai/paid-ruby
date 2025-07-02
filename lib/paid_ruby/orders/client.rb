# frozen_string_literal: true
require_relative "../../requests"
require_relative "lines/client"
require_relative "../types/order"
require "json"
require_relative "../types/order_line_create"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Paid
  class OrdersClient
  # @return [Paid::RequestClient] 
    attr_reader :request_client
  # @return [Paid::Orders::LinesClient] 
    attr_reader :lines


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::OrdersClient]
    def initialize(request_client:)
      @request_client = request_client
      @lines = Paid::Orders::LinesClient.new(request_client: request_client)
    end
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Paid::Order>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.list
    def list(request_options: nil)
      response = @request_client.conn.get do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        Paid::Order.from_json(json_object: item)
      end
    end
    # @param customer_id [String] 
    # @param customer_external_id [String] 
    # @param billing_contact_id [String] 
    # @param name [String] 
    # @param description [String] 
    # @param start_date [String] 
    # @param end_date [String] 
    # @param currency [String] 
    # @param order_lines [Array<Hash>] Request of type Array<Paid::OrderLineCreate>, as a Hash
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
#  api.orders.create(
#    customer_external_id: "acme-inc",
#    name: "Acme Order",
#    description: "Acme Order is an order for Acme, Inc.",
#    start_date: "2025-01-01",
#    end_date: "2026-01-01",
#    currency: "USD"
#  )
    def create(customer_id: nil, customer_external_id: nil, billing_contact_id: nil, name:, description: nil, start_date:, end_date: nil, currency:, order_lines: nil, request_options: nil)
      response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), customerId: customer_id, customerExternalId: customer_external_id, billingContactId: billing_contact_id, name: name, description: description, startDate: start_date, endDate: end_date, currency: currency, orderLines: order_lines }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/orders"
end
      Paid::Order.from_json(json_object: response.body)
    end
    # @param order_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Order]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.get(order_id: "orderId")
    def get(order_id:, request_options: nil)
      response = @request_client.conn.get do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}"
end
      Paid::Order.from_json(json_object: response.body)
    end
    # @param order_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.delete(order_id: "orderId")
    def delete(order_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}"
end
    end
    # @param order_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Order]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.activate(order_id: "orderId")
    def activate(order_id:, request_options: nil)
      response = @request_client.conn.post do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}/activate"
end
      Paid::Order.from_json(json_object: response.body)
    end
  end
  class AsyncOrdersClient
  # @return [Paid::AsyncRequestClient] 
    attr_reader :request_client
  # @return [Paid::Orders::LinesClient] 
    attr_reader :lines


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::AsyncOrdersClient]
    def initialize(request_client:)
      @request_client = request_client
      @lines = Paid::Orders::AsyncLinesClient.new(request_client: request_client)
    end
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Paid::Order>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.list
    def list(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          Paid::Order.from_json(json_object: item)
        end
      end
    end
    # @param customer_id [String] 
    # @param customer_external_id [String] 
    # @param billing_contact_id [String] 
    # @param name [String] 
    # @param description [String] 
    # @param start_date [String] 
    # @param end_date [String] 
    # @param currency [String] 
    # @param order_lines [Array<Hash>] Request of type Array<Paid::OrderLineCreate>, as a Hash
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
#  api.orders.create(
#    customer_external_id: "acme-inc",
#    name: "Acme Order",
#    description: "Acme Order is an order for Acme, Inc.",
#    start_date: "2025-01-01",
#    end_date: "2026-01-01",
#    currency: "USD"
#  )
    def create(customer_id: nil, customer_external_id: nil, billing_contact_id: nil, name:, description: nil, start_date:, end_date: nil, currency:, order_lines: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), customerId: customer_id, customerExternalId: customer_external_id, billingContactId: billing_contact_id, name: name, description: description, startDate: start_date, endDate: end_date, currency: currency, orderLines: order_lines }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/orders"
end
        Paid::Order.from_json(json_object: response.body)
      end
    end
    # @param order_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Order]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.get(order_id: "orderId")
    def get(order_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}"
end
        Paid::Order.from_json(json_object: response.body)
      end
    end
    # @param order_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.delete(order_id: "orderId")
    def delete(order_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}"
end
      end
    end
    # @param order_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Order]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.orders.activate(order_id: "orderId")
    def activate(order_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/orders/#{order_id}/activate"
end
        Paid::Order.from_json(json_object: response.body)
      end
    end
  end
end