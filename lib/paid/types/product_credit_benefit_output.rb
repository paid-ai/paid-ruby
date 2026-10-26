# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductCreditBenefitOutput < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :credits_currency_id, -> { String }, optional: false, nullable: true, api_name: "creditsCurrencyId"

      field :amount, -> { Float }, optional: false, nullable: false

      field :recipient, -> { String }, optional: false, nullable: false

      field :is_infinite_total, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isInfiniteTotal"

      field :allocation_cadence, -> { String }, optional: false, nullable: false, api_name: "allocationCadence"

      field :credit_grant_timing, -> { String }, optional: true, nullable: true, api_name: "creditGrantTiming"

      field :overage_unit_price, -> { Float }, optional: true, nullable: true, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :rollover_amount, -> { Float }, optional: true, nullable: true, api_name: "rolloverAmount"

      field :rollover_duration, -> { Float }, optional: true, nullable: true, api_name: "rolloverDuration"

      field :rollover_duration_unit, -> { String }, optional: true, nullable: true, api_name: "rolloverDurationUnit"
    end
  end
end
