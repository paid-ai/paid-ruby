# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductUsagePrepaidCreditsInput < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :signal_type, -> { Paid::Types::ProductUsagePrepaidCreditsInputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :credit_cost, -> { Float }, optional: false, nullable: false, api_name: "creditCost"

      field :unit_value, -> { Float }, optional: true, nullable: false, api_name: "unitValue"

      field :overage_unit_price, -> { Integer }, optional: true, nullable: false, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :pricing_input, -> { Paid::Types::ProductUsagePrepaidCreditsInputPricingInput }, optional: true, nullable: false, api_name: "pricingInput"

      field :billing_frequency, -> { Paid::Types::ProductUsagePrepaidCreditsInputBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProductUsagePrepaidCreditsInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::ProductSimplePricePoint] }, optional: true, nullable: false, api_name: "pricePoints"
    end
  end
end
