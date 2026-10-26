# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PricingInput < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :pricing_type

      member -> { Paid::Types::RecurringPerUnitInput }, key: "RECURRING_PER_UNIT"

      member -> { Paid::Types::RecurringGraduatedInput }, key: "RECURRING_GRADUATED"

      member -> { Paid::Types::RecurringVolumeInput }, key: "RECURRING_VOLUME"

      member -> { Paid::Types::RecurringPercentOfTotalInput }, key: "RECURRING_PERCENT_OF_TOTAL"

      member -> { Paid::Types::UsagePerUnitInput }, key: "USAGE_PER_UNIT"

      member -> { Paid::Types::UsageGraduatedInput }, key: "USAGE_GRADUATED"

      member -> { Paid::Types::UsageVolumeInput }, key: "USAGE_VOLUME"

      member -> { Paid::Types::UsagePrepaidCreditsInput }, key: "USAGE_PREPAID_CREDITS"

      member -> { Paid::Types::UsageBracketedPrepaidCreditsInput }, key: "USAGE_BRACKETED_PREPAID_CREDITS"

      member -> { Paid::Types::UsageCostPlusInput }, key: "USAGE_COST_PLUS"

      member -> { Paid::Types::OneTimePerUnitInput }, key: "ONE_TIME_PER_UNIT"

      member -> { Paid::Types::SeatBasedPerUnitInput }, key: "SEAT_BASED_PER_UNIT"

      member -> { Paid::Types::SeatBasedGraduatedInput }, key: "SEAT_BASED_GRADUATED"

      member -> { Paid::Types::SeatBasedVolumeInput }, key: "SEAT_BASED_VOLUME"

      member -> { Paid::Types::SeatBasedPrepaidCreditsInput }, key: "SEAT_BASED_PREPAID_CREDITS"
    end
  end
end
