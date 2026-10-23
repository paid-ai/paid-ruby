# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreateOrderLineAttributeRequestPricingCreditBenefitsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

      field :recipient, -> { Paid::Types::CreateOrderLineAttributeRequestPricingCreditBenefitsItemRecipient }, optional: true, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :overage_unit_price, -> { Integer }, optional: true, nullable: true, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :rollover_amount, -> { Float }, optional: true, nullable: true, api_name: "rolloverAmount"

      field :rollover_duration, -> { Integer }, optional: true, nullable: true, api_name: "rolloverDuration"

      field :rollover_duration_unit, -> { Paid::Types::CreateOrderLineAttributeRequestPricingCreditBenefitsItemRolloverDurationUnit }, optional: true, nullable: true, api_name: "rolloverDurationUnit"

      field :allocation_cadence, -> { Paid::Types::CreateOrderLineAttributeRequestPricingCreditBenefitsItemAllocationCadence }, optional: true, nullable: false, api_name: "allocationCadence"

      field :credit_grant_timing, -> { Paid::Types::CreateOrderLineAttributeRequestPricingCreditBenefitsItemCreditGrantTiming }, optional: true, nullable: true, api_name: "creditGrantTiming"
    end
  end
end
