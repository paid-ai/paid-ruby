# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/contact"
require "json"
require_relative "../types/salutation"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Paid
  class ContactsClient
  # @return [Paid::RequestClient] 
    attr_reader :request_client


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::ContactsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Paid::Contact>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.list
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        Paid::Contact.from_json(json_object: item)
      end
    end
    # @param external_id [String] 
    # @param customer_id [String] 
    # @param customer_external_id [String] 
    # @param salutation [Paid::Salutation] 
    # @param first_name [String] 
    # @param last_name [String] 
    # @param email [String] 
    # @param phone [String] 
    # @param billing_street [String] 
    # @param billing_city [String] 
    # @param billing_state_province [String] 
    # @param billing_country [String] 
    # @param billing_postal_code [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Contact]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.create(
#    customer_external_id: "acme-inc",
#    salutation: MR,
#    first_name: "John",
#    last_name: "Doe",
#    email: "john.doe@example.com"
#  )
    def create(external_id: nil, customer_id: nil, customer_external_id: nil, salutation:, first_name:, last_name:, email:, phone: nil, billing_street: nil, billing_city: nil, billing_state_province: nil, billing_country: nil, billing_postal_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), externalId: external_id, customerId: customer_id, customerExternalId: customer_external_id, salutation: salutation, firstName: first_name, lastName: last_name, email: email, phone: phone, billingStreet: billing_street, billingCity: billing_city, billingStateProvince: billing_state_province, billingCountry: billing_country, billingPostalCode: billing_postal_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
end
      Paid::Contact.from_json(json_object: response.body)
    end
    # @param contact_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Contact]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.get(contact_id: "contactId")
    def get(contact_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/#{contact_id}"
end
      Paid::Contact.from_json(json_object: response.body)
    end
    # @param contact_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.delete(contact_id: "contactId")
    def delete(contact_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/#{contact_id}"
end
    end
    # @param external_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Contact]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.get_by_external_id(external_id: "externalId")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/external/#{external_id}"
end
      Paid::Contact.from_json(json_object: response.body)
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
#  api.contacts.delete_by_external_id(external_id: "externalId")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/external/#{external_id}"
end
    end
  end
  class AsyncContactsClient
  # @return [Paid::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::AsyncContactsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Paid::Contact>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.list
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          Paid::Contact.from_json(json_object: item)
        end
      end
    end
    # @param external_id [String] 
    # @param customer_id [String] 
    # @param customer_external_id [String] 
    # @param salutation [Paid::Salutation] 
    # @param first_name [String] 
    # @param last_name [String] 
    # @param email [String] 
    # @param phone [String] 
    # @param billing_street [String] 
    # @param billing_city [String] 
    # @param billing_state_province [String] 
    # @param billing_country [String] 
    # @param billing_postal_code [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Contact]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.create(
#    customer_external_id: "acme-inc",
#    salutation: MR,
#    first_name: "John",
#    last_name: "Doe",
#    email: "john.doe@example.com"
#  )
    def create(external_id: nil, customer_id: nil, customer_external_id: nil, salutation:, first_name:, last_name:, email:, phone: nil, billing_street: nil, billing_city: nil, billing_state_province: nil, billing_country: nil, billing_postal_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), externalId: external_id, customerId: customer_id, customerExternalId: customer_external_id, salutation: salutation, firstName: first_name, lastName: last_name, email: email, phone: phone, billingStreet: billing_street, billingCity: billing_city, billingStateProvince: billing_state_province, billingCountry: billing_country, billingPostalCode: billing_postal_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
end
        Paid::Contact.from_json(json_object: response.body)
      end
    end
    # @param contact_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Contact]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.get(contact_id: "contactId")
    def get(contact_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/#{contact_id}"
end
        Paid::Contact.from_json(json_object: response.body)
      end
    end
    # @param contact_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Void]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.delete(contact_id: "contactId")
    def delete(contact_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/#{contact_id}"
end
      end
    end
    # @param external_id [String] 
    # @param request_options [Paid::RequestOptions] 
    # @return [Paid::Contact]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.contacts.get_by_external_id(external_id: "externalId")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/external/#{external_id}"
end
        Paid::Contact.from_json(json_object: response.body)
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
#  api.contacts.delete_by_external_id(external_id: "externalId")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/contacts/external/#{external_id}"
end
      end
    end
  end
end