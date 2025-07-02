# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/customer"
require "json"
require_relative "../types/tax_exempt_status"
require_relative "../types/creation_source"
require_relative "../types/address"
require_relative "../types/customer_update"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Paid
  class CustomersClient
  # @return [Paid::RequestClient] 
    attr_reader :request_client


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::CustomersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Paid::Customer>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.list
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        Paid::Customer.from_json(json_object: item)
      end
    end
    # @param name [String] 
    # @param external_id [String] 
    # @param phone [String] 
    # @param employee_count [Float] 
    # @param annual_revenue [Float] 
    # @param tax_exempt_status [Paid::TaxExemptStatus] 
    # @param creation_source [Paid::CreationSource] 
    # @param website [String] 
    # @param billing_address [Hash] Request of type Paid::Address, as a Hash
    #   * :line_1 (String) 
    #   * :line_2 (String) 
    #   * :city (String) 
    #   * :state (String) 
    #   * :zip_code (String) 
    #   * :country (String) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.create(name: "Acme, Inc.", external_id: "acme-inc")
    def create(name:, external_id: nil, phone: nil, employee_count: nil, annual_revenue: nil, tax_exempt_status: nil, creation_source: nil, website: nil, billing_address: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, externalId: external_id, phone: phone, employeeCount: employee_count, annualRevenue: annual_revenue, taxExemptStatus: tax_exempt_status, creationSource: creation_source, website: website, billingAddress: billing_address }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/customers"
end
      Paid::Customer.from_json(json_object: response.body)
    end
    # @param customer_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.get(customer_id: "customerId")
    def get(customer_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/#{customer_id}"
end
      Paid::Customer.from_json(json_object: response.body)
    end
    # @param customer_id [String] 
    # @param request [Hash] Request of type Paid::CustomerUpdate, as a Hash
    #   * :name (String) 
    #   * :external_id (String) 
    #   * :phone (String) 
    #   * :employee_count (Float) 
    #   * :annual_revenue (Float) 
    #   * :tax_exempt_status (Paid::TaxExemptStatus) 
    #   * :creation_source (Paid::CreationSource) 
    #   * :website (String) 
    #   * :billing_address (Hash)
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :city (String) 
    #     * :state (String) 
    #     * :zip_code (String) 
    #     * :country (String) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.update(customer_id: "customerId", request: { name: "Acme, Inc. (Updated)", phone: "123-456-7890", employee_count: 101, annual_revenue: 1000001 })
    def update(customer_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/#{customer_id}"
end
      Paid::Customer.from_json(json_object: response.body)
    end
    # @param customer_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.delete(customer_id: "customerId")
    def delete(customer_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/#{customer_id}"
end
    end
    # @param external_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.get_by_external_id(external_id: "externalId")
    def get_by_external_id(external_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/external/#{external_id}"
end
      Paid::Customer.from_json(json_object: response.body)
    end
    # @param external_id [String] 
    # @param request [Hash] Request of type Paid::CustomerUpdate, as a Hash
    #   * :name (String) 
    #   * :external_id (String) 
    #   * :phone (String) 
    #   * :employee_count (Float) 
    #   * :annual_revenue (Float) 
    #   * :tax_exempt_status (Paid::TaxExemptStatus) 
    #   * :creation_source (Paid::CreationSource) 
    #   * :website (String) 
    #   * :billing_address (Hash)
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :city (String) 
    #     * :state (String) 
    #     * :zip_code (String) 
    #     * :country (String) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.update_by_external_id(external_id: "externalId", request: {  })
    def update_by_external_id(external_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/external/#{external_id}"
end
      Paid::Customer.from_json(json_object: response.body)
    end
    # @param external_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.delete_by_external_id(external_id: "externalId")
    def delete_by_external_id(external_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/external/#{external_id}"
end
    end
  end
  class AsyncCustomersClient
  # @return [Paid::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::AsyncCustomersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Paid::Customer>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.list
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          Paid::Customer.from_json(json_object: item)
        end
      end
    end
    # @param name [String] 
    # @param external_id [String] 
    # @param phone [String] 
    # @param employee_count [Float] 
    # @param annual_revenue [Float] 
    # @param tax_exempt_status [Paid::TaxExemptStatus] 
    # @param creation_source [Paid::CreationSource] 
    # @param website [String] 
    # @param billing_address [Hash] Request of type Paid::Address, as a Hash
    #   * :line_1 (String) 
    #   * :line_2 (String) 
    #   * :city (String) 
    #   * :state (String) 
    #   * :zip_code (String) 
    #   * :country (String) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.create(name: "Acme, Inc.", external_id: "acme-inc")
    def create(name:, external_id: nil, phone: nil, employee_count: nil, annual_revenue: nil, tax_exempt_status: nil, creation_source: nil, website: nil, billing_address: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, externalId: external_id, phone: phone, employeeCount: employee_count, annualRevenue: annual_revenue, taxExemptStatus: tax_exempt_status, creationSource: creation_source, website: website, billingAddress: billing_address }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/customers"
end
        Paid::Customer.from_json(json_object: response.body)
      end
    end
    # @param customer_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.get(customer_id: "customerId")
    def get(customer_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/#{customer_id}"
end
        Paid::Customer.from_json(json_object: response.body)
      end
    end
    # @param customer_id [String] 
    # @param request [Hash] Request of type Paid::CustomerUpdate, as a Hash
    #   * :name (String) 
    #   * :external_id (String) 
    #   * :phone (String) 
    #   * :employee_count (Float) 
    #   * :annual_revenue (Float) 
    #   * :tax_exempt_status (Paid::TaxExemptStatus) 
    #   * :creation_source (Paid::CreationSource) 
    #   * :website (String) 
    #   * :billing_address (Hash)
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :city (String) 
    #     * :state (String) 
    #     * :zip_code (String) 
    #     * :country (String) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.update(customer_id: "customerId", request: { name: "Acme, Inc. (Updated)", phone: "123-456-7890", employee_count: 101, annual_revenue: 1000001 })
    def update(customer_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/#{customer_id}"
end
        Paid::Customer.from_json(json_object: response.body)
      end
    end
    # @param customer_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.delete(customer_id: "customerId")
    def delete(customer_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/#{customer_id}"
end
      end
    end
    # @param external_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.get_by_external_id(external_id: "externalId")
    def get_by_external_id(external_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/external/#{external_id}"
end
        Paid::Customer.from_json(json_object: response.body)
      end
    end
    # @param external_id [String] 
    # @param request [Hash] Request of type Paid::CustomerUpdate, as a Hash
    #   * :name (String) 
    #   * :external_id (String) 
    #   * :phone (String) 
    #   * :employee_count (Float) 
    #   * :annual_revenue (Float) 
    #   * :tax_exempt_status (Paid::TaxExemptStatus) 
    #   * :creation_source (Paid::CreationSource) 
    #   * :website (String) 
    #   * :billing_address (Hash)
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :city (String) 
    #     * :state (String) 
    #     * :zip_code (String) 
    #     * :country (String) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Customer]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.update_by_external_id(external_id: "externalId", request: {  })
    def update_by_external_id(external_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/external/#{external_id}"
end
        Paid::Customer.from_json(json_object: response.body)
      end
    end
    # @param external_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.customers.delete_by_external_id(external_id: "externalId")
    def delete_by_external_id(external_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/customers/external/#{external_id}"
end
      end
    end
  end
end