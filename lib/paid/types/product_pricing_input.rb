# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductPricingInput < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :pricing_type

      member -> { Paid::Types::ProductRecurringPerUnitInput }, key: "RECURRING_PER_UNIT"

      member -> { Paid::Types::ProductRecurringGraduatedInput }, key: "RECURRING_GRADUATED"

      member -> { Paid::Types::ProductRecurringVolumeInput }, key: "RECURRING_VOLUME"

      member -> { Paid::Types::ProductRecurringPercentOfTotalInput }, key: "RECURRING_PERCENT_OF_TOTAL"

      member -> { Paid::Types::ProductUsagePerUnitInput }, key: "USAGE_PER_UNIT"

      member -> { Paid::Types::ProductUsageGraduatedInput }, key: "USAGE_GRADUATED"

      member -> { Paid::Types::ProductUsageVolumeInput }, key: "USAGE_VOLUME"

      member -> { Paid::Types::ProductUsagePrepaidCreditsInput }, key: "USAGE_PREPAID_CREDITS"

      member -> { Paid::Types::ProductUsageBracketedPrepaidCreditsInput }, key: "USAGE_BRACKETED_PREPAID_CREDITS"

      member -> { Paid::Types::ProductUsageCostPlusInput }, key: "USAGE_COST_PLUS"

      member -> { Paid::Types::ProductOneTimePerUnitInput }, key: "ONE_TIME_PER_UNIT"

      member -> { Paid::Types::ProductSeatBasedPerUnitInput }, key: "SEAT_BASED_PER_UNIT"

      member -> { Paid::Types::ProductSeatBasedGraduatedInput }, key: "SEAT_BASED_GRADUATED"

      member -> { Paid::Types::ProductSeatBasedVolumeInput }, key: "SEAT_BASED_VOLUME"

      member -> { Paid::Types::ProductSeatBasedPrepaidCreditsInput }, key: "SEAT_BASED_PREPAID_CREDITS"
    end
  end
end
