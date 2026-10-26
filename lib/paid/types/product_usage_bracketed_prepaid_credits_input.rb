# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductUsageBracketedPrepaidCreditsInput < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :signal_type, -> { Paid::Types::ProductUsageBracketedPrepaidCreditsInputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

      field :unit_value, -> { Float }, optional: true, nullable: false, api_name: "unitValue"

      field :overage_unit_price, -> { Integer }, optional: true, nullable: false, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :credit_rollover_amount, -> { Float }, optional: true, nullable: false, api_name: "creditRolloverAmount"

      field :pricing_input, -> { Paid::Types::ProductUsageBracketedPrepaidCreditsInputPricingInput }, optional: false, nullable: false, api_name: "pricingInput"

      field :credit_unit_brackets, -> { Internal::Types::Array[Paid::Types::ProductUsageBracketedPrepaidCreditsInputCreditUnitBracketsItem] }, optional: false, nullable: false, api_name: "creditUnitBrackets"

      field :billing_frequency, -> { Paid::Types::ProductUsageBracketedPrepaidCreditsInputBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProductUsageBracketedPrepaidCreditsInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::ProductSimplePricePoint] }, optional: true, nullable: false, api_name: "pricePoints"
    end
  end
end
