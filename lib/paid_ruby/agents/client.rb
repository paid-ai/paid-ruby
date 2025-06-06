# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/agent"
require "json"
require_relative "../types/agent_update"
require "async"

module Paid
  class AgentsClient
    # @return [Paid::RequestClient]
    attr_reader :request_client

    # @param request_client [Paid::RequestClient]
    # @return [Paid::AgentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request_options [Paid::RequestOptions]
    # @return [Array<Paid::Agent>]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.list
    def list(request_options: nil)
      response = @request_client.conn.get do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/agents"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Paid::Agent.from_json(json_object: item)
      end
    end

    # @param name [String]
    # @param description [String]
    # @param agent_code [String]
    # @param external_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.create(name: "name", description: "description")
    def create(name:, description:, agent_code: nil, external_id: nil, request_options: nil)
      response = @request_client.conn.post do |req|
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
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          description: description,
          agentCode: agent_code,
          externalId: external_id
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/agents"
      end
      Paid::Agent.from_json(json_object: response.body)
    end

    # @param agent_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.get(agent_id: "agentId")
    def get(agent_id:, request_options: nil)
      response = @request_client.conn.get do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/agents/#{agent_id}"
      end
      Paid::Agent.from_json(json_object: response.body)
    end

    # @param agent_id [String]
    # @param request [Hash] Request of type Paid::AgentUpdate, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :external_id (String)
    #   * :active (Boolean)
    #   * :agent_code (String)
    #   * :agent_attributes (Array<Paid::AgentAttribute>)
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.update(agent_id: "agentId", request: {  })
    def update(agent_id:, request:, request_options: nil)
      response = @request_client.conn.put do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/agents/#{agent_id}"
      end
      Paid::Agent.from_json(json_object: response.body)
    end

    # @param agent_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Void]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.delete(agent_id: "agentId")
    def delete(agent_id:, request_options: nil)
      @request_client.conn.delete do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/agents/#{agent_id}"
      end
    end

    # @param external_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.get_by_external_id(external_id: "externalId")
    def get_by_external_id(external_id:, request_options: nil)
      response = @request_client.conn.get do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/agents/external/#{external_id}"
      end
      Paid::Agent.from_json(json_object: response.body)
    end

    # @param external_id [String]
    # @param request [Hash] Request of type Paid::AgentUpdate, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :external_id (String)
    #   * :active (Boolean)
    #   * :agent_code (String)
    #   * :agent_attributes (Array<Paid::AgentAttribute>)
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.update_by_external_id(external_id: "externalId", request: {  })
    def update_by_external_id(external_id:, request:, request_options: nil)
      response = @request_client.conn.put do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/agents/external/#{external_id}"
      end
      Paid::Agent.from_json(json_object: response.body)
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
    #  api.agents.delete_by_external_id(external_id: "externalId")
    def delete_by_external_id(external_id:, request_options: nil)
      @request_client.conn.delete do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/agents/external/#{external_id}"
      end
    end
  end

  class AsyncAgentsClient
    # @return [Paid::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Paid::AsyncRequestClient]
    # @return [Paid::AsyncAgentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request_options [Paid::RequestOptions]
    # @return [Array<Paid::Agent>]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.list
    def list(request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/agents"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Paid::Agent.from_json(json_object: item)
        end
      end
    end

    # @param name [String]
    # @param description [String]
    # @param agent_code [String]
    # @param external_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.create(name: "name", description: "description")
    def create(name:, description:, agent_code: nil, external_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            description: description,
            agentCode: agent_code,
            externalId: external_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/agents"
        end
        Paid::Agent.from_json(json_object: response.body)
      end
    end

    # @param agent_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.get(agent_id: "agentId")
    def get(agent_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/agents/#{agent_id}"
        end
        Paid::Agent.from_json(json_object: response.body)
      end
    end

    # @param agent_id [String]
    # @param request [Hash] Request of type Paid::AgentUpdate, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :external_id (String)
    #   * :active (Boolean)
    #   * :agent_code (String)
    #   * :agent_attributes (Array<Paid::AgentAttribute>)
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.update(agent_id: "agentId", request: {  })
    def update(agent_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.put do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/agents/#{agent_id}"
        end
        Paid::Agent.from_json(json_object: response.body)
      end
    end

    # @param agent_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Void]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.delete(agent_id: "agentId")
    def delete(agent_id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/agents/#{agent_id}"
        end
      end
    end

    # @param external_id [String]
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.get_by_external_id(external_id: "externalId")
    def get_by_external_id(external_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/agents/external/#{external_id}"
        end
        Paid::Agent.from_json(json_object: response.body)
      end
    end

    # @param external_id [String]
    # @param request [Hash] Request of type Paid::AgentUpdate, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :external_id (String)
    #   * :active (Boolean)
    #   * :agent_code (String)
    #   * :agent_attributes (Array<Paid::AgentAttribute>)
    # @param request_options [Paid::RequestOptions]
    # @return [Paid::Agent]
    # @example
    #  api = Paid::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Paid::Environment::PRODUCTION,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.agents.update_by_external_id(external_id: "externalId", request: {  })
    def update_by_external_id(external_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.put do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/agents/external/#{external_id}"
        end
        Paid::Agent.from_json(json_object: response.body)
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
    #  api.agents.delete_by_external_id(external_id: "externalId")
    def delete_by_external_id(external_id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/agents/external/#{external_id}"
        end
      end
    end
  end
end
