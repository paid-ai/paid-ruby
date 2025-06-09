# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/signal"
require "json"
require "async"
require_relative "../../requests"

module Paid
  class UsageClient
  # @return [Paid::RequestClient] 
    attr_reader :request_client


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::UsageClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param signals [Array<Hash>] Request of type Array<Paid::Signal>, as a Hash
    #   * :event_name (String) 
    #   * :agent_id (String) 
    #   * :customer_id (String) 
    #   * :data (Hash{String => Object}) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Object>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.usage.record_bulk
    def record_bulk(signals: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), signals: signals }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/usage/signals/bulk"
end
      parsed_json = JSON.parse(response.body)
      parsed_json
    end
  end
  class AsyncUsageClient
  # @return [Paid::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Paid::RequestClient] 
    # @return [Paid::AsyncUsageClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param signals [Array<Hash>] Request of type Array<Paid::Signal>, as a Hash
    #   * :event_name (String) 
    #   * :agent_id (String) 
    #   * :customer_id (String) 
    #   * :data (Hash{String => Object}) 
    # @param request_options [Paid::RequestOptions] 
    # @return [Array<Object>]
    # @example
#  api = Paid::Client.new(
#    base_url: "https://api.example.com",
#    environment: Paid::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN"
#  )
#  api.usage.record_bulk
    def record_bulk(signals: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), signals: signals }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/usage/signals/bulk"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
  end
end