# frozen_string_literal: true

module Paid
  class Client
    # @param token [String]
    # @param base_url [String, nil]
    # @param max_retries [Integer]
    # @param timeout [Numeric]
    #
    # @return [void]
    def initialize(token:, base_url: nil, max_retries: 2, timeout: 60)
      @raw_client = Paid::Internal::Http::RawClient.new(
        base_url: base_url || Paid::Environment::DEFAULT,
        headers: {
          "User-Agent" => "paid_ruby/2.0.0",
          "X-Fern-Language" => "Ruby",
          Authorization: "Bearer #{token}"
        },
        max_retries: max_retries,
        timeout: timeout
      )
    end

    # @return [Paid::Products::Client]
    def products
      @products ||= Paid::Products::Client.new(client: @raw_client)
    end

    # @return [Paid::Plans::Client]
    def plans
      @plans ||= Paid::Plans::Client.new(client: @raw_client)
    end

    # @return [Paid::Customers::Client]
    def customers
      @customers ||= Paid::Customers::Client.new(client: @raw_client)
    end

    # @return [Paid::Contacts::Client]
    def contacts
      @contacts ||= Paid::Contacts::Client.new(client: @raw_client)
    end

    # @return [Paid::Orders::Client]
    def orders
      @orders ||= Paid::Orders::Client.new(client: @raw_client)
    end

    # @return [Paid::Invoices::Client]
    def invoices
      @invoices ||= Paid::Invoices::Client.new(client: @raw_client)
    end

    # @return [Paid::Signals::Client]
    def signals
      @signals ||= Paid::Signals::Client.new(client: @raw_client)
    end

    # @return [Paid::Credits::Client]
    def credits
      @credits ||= Paid::Credits::Client.new(client: @raw_client)
    end

    # @return [Paid::Checkouts::Client]
    def checkouts
      @checkouts ||= Paid::Checkouts::Client.new(client: @raw_client)
    end

    # @return [Paid::CustomerPortals::Client]
    def customer_portals
      @customer_portals ||= Paid::CustomerPortals::Client.new(client: @raw_client)
    end

    # @return [Paid::ValueReceipts::Client]
    def value_receipts
      @value_receipts ||= Paid::ValueReceipts::Client.new(client: @raw_client)
    end

    # @return [Paid::DeliveredValue::Client]
    def delivered_value
      @delivered_value ||= Paid::DeliveredValue::Client.new(client: @raw_client)
    end

    # @return [Paid::Webhooks::Client]
    def webhooks
      @webhooks ||= Paid::Webhooks::Client.new(client: @raw_client)
    end

    # @return [Paid::Pricing::Client]
    def pricing
      @pricing ||= Paid::Pricing::Client.new(client: @raw_client)
    end

    # @return [Paid::Costs::Client]
    def costs
      @costs ||= Paid::Costs::Client.new(client: @raw_client)
    end

    # @return [Paid::Analytics::Client]
    def analytics
      @analytics ||= Paid::Analytics::Client.new(client: @raw_client)
    end

    # @return [Paid::CustomViewsExperimental::Client]
    def custom_views_experimental
      @custom_views_experimental ||= Paid::CustomViewsExperimental::Client.new(client: @raw_client)
    end

    # @return [Paid::ValueModels::Client]
    def value_models
      @value_models ||= Paid::ValueModels::Client.new(client: @raw_client)
    end

    # @return [Paid::ValueMetrics::Client]
    def value_metrics
      @value_metrics ||= Paid::ValueMetrics::Client.new(client: @raw_client)
    end

    # @return [Paid::PaymentMethods::Client]
    def payment_methods
      @payment_methods ||= Paid::PaymentMethods::Client.new(client: @raw_client)
    end

    # @return [Paid::Payments::Client]
    def payments
      @payments ||= Paid::Payments::Client.new(client: @raw_client)
    end

    # @return [Paid::PaymentAllocations::Client]
    def payment_allocations
      @payment_allocations ||= Paid::PaymentAllocations::Client.new(client: @raw_client)
    end

    # @return [Paid::Amendments::Client]
    def amendments
      @amendments ||= Paid::Amendments::Client.new(client: @raw_client)
    end

    # @return [Paid::AnalyticsExperimental::Client]
    def analytics_experimental
      @analytics_experimental ||= Paid::AnalyticsExperimental::Client.new(client: @raw_client)
    end
  end
end
