# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PricingOutput < Internal::Types::Model
      field :pricing_type, -> { Paid::Types::PricingOutputPricingType }, optional: false, nullable: false, api_name: "pricingType"

      field :charge_type, -> { String }, optional: false, nullable: false, api_name: "chargeType"

      field :pricing_model, -> { String }, optional: true, nullable: false, api_name: "pricingModel"

      field :event_name, -> { String }, optional: true, nullable: false, api_name: "eventName"

      field :signal_type, -> { Paid::Types::PricingOutputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :billing_frequency, -> { String }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_type, -> { String }, optional: true, nullable: false, api_name: "billingType"

      field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

      field :credit_cost, -> { Float }, optional: true, nullable: false, api_name: "creditCost"

      field :unit_value, -> { Float }, optional: true, nullable: false, api_name: "unitValue"

      field :overage_unit_price, -> { Float }, optional: true, nullable: true, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :percentage_value, -> { Float }, optional: true, nullable: false, api_name: "percentageValue"

      field :cost_plus_multiplier, -> { Float }, optional: true, nullable: false, api_name: "costPlusMultiplier"

      field :price_points, -> { Internal::Types::Array[Paid::Types::PricingPricePointOutput] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
