# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "paid_ruby/customers/client"
require_relative "paid_ruby/agents/client"
require_relative "paid_ruby/contacts/client"
require_relative "paid_ruby/orders/client"
require_relative "paid_ruby/usage/client"

module PaidApiClient
  class Client
    # @return [PaidApiClient::CustomersClient]
    attr_reader :customers
    # @return [PaidApiClient::AgentsClient]
    attr_reader :agents
    # @return [PaidApiClient::ContactsClient]
    attr_reader :contacts
    # @return [PaidApiClient::OrdersClient]
    attr_reader :orders
    # @return [PaidApiClient::UsageClient]
    attr_reader :usage

    # @param base_url [String]
    # @param environment [PaidApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [PaidApiClient::Client]
    def initialize(token:, base_url: nil, environment: PaidApiClient::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = PaidApiClient::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @customers = PaidApiClient::CustomersClient.new(request_client: @request_client)
      @agents = PaidApiClient::AgentsClient.new(request_client: @request_client)
      @contacts = PaidApiClient::ContactsClient.new(request_client: @request_client)
      @orders = PaidApiClient::OrdersClient.new(request_client: @request_client)
      @usage = PaidApiClient::UsageClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [PaidApiClient::AsyncCustomersClient]
    attr_reader :customers
    # @return [PaidApiClient::AsyncAgentsClient]
    attr_reader :agents
    # @return [PaidApiClient::AsyncContactsClient]
    attr_reader :contacts
    # @return [PaidApiClient::AsyncOrdersClient]
    attr_reader :orders
    # @return [PaidApiClient::AsyncUsageClient]
    attr_reader :usage

    # @param base_url [String]
    # @param environment [PaidApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [PaidApiClient::AsyncClient]
    def initialize(token:, base_url: nil, environment: PaidApiClient::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = PaidApiClient::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @customers = PaidApiClient::AsyncCustomersClient.new(request_client: @async_request_client)
      @agents = PaidApiClient::AsyncAgentsClient.new(request_client: @async_request_client)
      @contacts = PaidApiClient::AsyncContactsClient.new(request_client: @async_request_client)
      @orders = PaidApiClient::AsyncOrdersClient.new(request_client: @async_request_client)
      @usage = PaidApiClient::AsyncUsageClient.new(request_client: @async_request_client)
    end
  end
end
