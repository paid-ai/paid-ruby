# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "paid_ruby/customers/client"
require_relative "paid_ruby/agents/client"
require_relative "paid_ruby/contacts/client"
require_relative "paid_ruby/orders/client"
require_relative "paid_ruby/usage/client"
require_relative "extensions/batch"
require_relative "paid_ruby/tracing/tracing"
require_relative "paid_ruby/tracing/wrappers/open_ai_wrapper"

module Paid
  class Client
    # @return [Paid::CustomersClient]
    attr_reader :customers
    # @return [Paid::AgentsClient]
    attr_reader :agents
    # @return [Paid::ContactsClient]
    attr_reader :contacts
    # @return [Paid::OrdersClient]
    attr_reader :orders
    # @return [Paid::UsageClient]
    attr_reader :usage

    # @param base_url [String]
    # @param environment [Paid::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [Paid::Client]
    def initialize(token:, base_url: nil, environment: Paid::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = Paid::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @customers = Paid::CustomersClient.new(request_client: @request_client)
      @agents = Paid::AgentsClient.new(request_client: @request_client)
      @contacts = Paid::ContactsClient.new(request_client: @request_client)
      @orders = Paid::OrdersClient.new(request_client: @request_client)
      @usage = Paid::BatchUsageClient.new(request_client: @request_client)
    end

    def initialize_tracing
      token = @request_client.token
      api_key = token.gsub(/^Bearer /, "")
      Paid::Tracing.initialize_tracing(api_key: api_key)
    end

    # @param external_customer_id [String]
    # @param args [Array]
    # @param block [Proc]
    def capture(*args, external_customer_id:, &block)
      Paid::Tracing.capture(*args, external_customer_id: external_customer_id, &block)
    end
  end

  class AsyncClient
    # @return [Paid::AsyncCustomersClient]
    attr_reader :customers
    # @return [Paid::AsyncAgentsClient]
    attr_reader :agents
    # @return [Paid::AsyncContactsClient]
    attr_reader :contacts
    # @return [Paid::AsyncOrdersClient]
    attr_reader :orders
    # @return [Paid::AsyncUsageClient]
    attr_reader :usage

    # @param base_url [String]
    # @param environment [Paid::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [Paid::AsyncClient]
    def initialize(token:, base_url: nil, environment: Paid::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = Paid::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @customers = Paid::AsyncCustomersClient.new(request_client: @async_request_client)
      @agents = Paid::AsyncAgentsClient.new(request_client: @async_request_client)
      @contacts = Paid::AsyncContactsClient.new(request_client: @async_request_client)
      @orders = Paid::AsyncOrdersClient.new(request_client: @async_request_client)
      @usage = Paid::AsyncBatchUsageClient.new(request_client: @async_request_client)
    end

    def initialize_tracing
      token = @async_request_client.token
      api_key = token.gsub(/^Bearer /, "")
      Paid::Tracing.initialize_tracing(api_key: api_key)
    end

    # @param external_customer_id [String]
    # @param args [Array]
    # @param block [Proc]
    def capture(*args, external_customer_id:, &block)
      Paid::Tracing.capture(*args, external_customer_id: external_customer_id, &block)
    end
  end
end
