# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/signal"
require "async"

module PaidApiClient
  class UsageClient
    # @return [PaidApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [PaidApiClient::RequestClient]
    # @return [PaidApiClient::UsageClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request [Array<Hash>] Request of type Array<PaidApiClient::Signal>, as a Hash
    #   * :event_name (String)
    #   * :agent_id (String)
    #   * :customer_id (String)
    #   * :data (Hash{String => Object})
    # @param request_options [PaidApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = PaidApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: PaidApiClient::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.usage.record(request: [{  }])
    def record(request:, request_options: nil)
      @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/usage/signals/bulk"
      end
    end
  end

  class AsyncUsageClient
    # @return [PaidApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [PaidApiClient::AsyncRequestClient]
    # @return [PaidApiClient::AsyncUsageClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request [Array<Hash>] Request of type Array<PaidApiClient::Signal>, as a Hash
    #   * :event_name (String)
    #   * :agent_id (String)
    #   * :customer_id (String)
    #   * :data (Hash{String => Object})
    # @param request_options [PaidApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = PaidApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: PaidApiClient::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.usage.record(request: [{  }])
    def record(request:, request_options: nil)
      Async do
        @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/usage/signals/bulk"
        end
      end
    end
  end
end
