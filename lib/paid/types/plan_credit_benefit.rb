# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PlanCreditBenefit < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

      field :recipient, -> { Paid::Types::PlanCreditBenefitRecipient }, optional: true, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :rollover_amount, -> { Float }, optional: true, nullable: true, api_name: "rolloverAmount"

      field :rollover_duration, -> { Float }, optional: true, nullable: true, api_name: "rolloverDuration"

      field :rollover_duration_unit, -> { Paid::Types::PlanCreditBenefitRolloverDurationUnit }, optional: true, nullable: true, api_name: "rolloverDurationUnit"

      field :allocation_cadence, -> { String }, optional: true, nullable: false, api_name: "allocationCadence"

      field :credit_grant_timing, -> { Paid::Types::PlanCreditBenefitCreditGrantTiming }, optional: true, nullable: true, api_name: "creditGrantTiming"

      field :is_infinite_total, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isInfiniteTotal"

      field :overage_unit_price, -> { Float }, optional: true, nullable: true, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: true, api_name: "overageUnitPrices"
    end
  end
end
