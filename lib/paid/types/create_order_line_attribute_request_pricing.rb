# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreateOrderLineAttributeRequestPricing < Internal::Types::Model
      field :event_name, -> { String }, optional: true, nullable: false, api_name: "eventName"

      field :charge_type, -> { Paid::Types::CreateOrderLineAttributeRequestPricingChargeType }, optional: false, nullable: false, api_name: "chargeType"

      field :price_points, -> { Paid::Types::CreateOrderLineAttributeRequestPricingPricePoints }, optional: false, nullable: false, api_name: "pricePoints"

      field :pricing_model, -> { Paid::Types::CreateOrderLineAttributeRequestPricingPricingModel }, optional: false, nullable: false, api_name: "pricingModel"

      field :billing_frequency, -> { Paid::Types::CreateOrderLineAttributeRequestPricingBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::CreateOrderLineAttributeRequestPricingBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :signal_type, -> { Paid::Types::CreateOrderLineAttributeRequestPricingSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

      field :credit_cost, -> { Float }, optional: true, nullable: false, api_name: "creditCost"

      field :overage_unit_price, -> { Integer }, optional: true, nullable: false, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :credit_rollover_amount, -> { Float }, optional: true, nullable: false, api_name: "creditRolloverAmount"

      field :credit_benefits, -> { Internal::Types::Array[Paid::Types::CreateOrderLineAttributeRequestPricingCreditBenefitsItem] }, optional: true, nullable: false, api_name: "creditBenefits"

      field :pricing_input, -> { Paid::Types::CreateOrderLineAttributeRequestPricingPricingInput }, optional: true, nullable: false, api_name: "pricingInput"

      field :credit_unit_brackets, -> { Internal::Types::Array[Paid::Types::CreateOrderLineAttributeRequestPricingCreditUnitBracketsItem] }, optional: true, nullable: false, api_name: "creditUnitBrackets"
    end
  end
end
