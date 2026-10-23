# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentPlanMoneyEffectKind
      extend Paid::Internal::Types::Enum

      PRORATION_CREDIT = "prorationCredit"
      PRORATION_CHARGE = "prorationCharge"
      FIRST_PERIOD_CHARGE = "firstPeriodCharge"
    end
  end
end
