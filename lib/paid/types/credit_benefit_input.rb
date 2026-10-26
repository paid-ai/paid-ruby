# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditBenefitInput < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :amount, -> { Float }, optional: false, nullable: false

      field :recipient, -> { Paid::Types::CreditBenefitInputRecipient }, optional: true, nullable: false

      field :is_infinite_total, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isInfiniteTotal"

      field :allocation_cadence, -> { Paid::Types::CreditBenefitInputAllocationCadence }, optional: true, nullable: false, api_name: "allocationCadence"

      field :credit_grant_timing, -> { Paid::Types::CreditBenefitInputCreditGrantTiming }, optional: true, nullable: true, api_name: "creditGrantTiming"

      field :overage_unit_price, -> { Integer }, optional: true, nullable: true, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :rollover_amount, -> { Float }, optional: true, nullable: true, api_name: "rolloverAmount"

      field :rollover_duration, -> { Integer }, optional: true, nullable: true, api_name: "rolloverDuration"

      field :rollover_duration_unit, -> { String }, optional: true, nullable: true, api_name: "rolloverDurationUnit"
    end
  end
end
