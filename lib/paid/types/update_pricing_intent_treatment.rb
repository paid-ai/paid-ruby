# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module UpdatePricingIntentTreatment
      extend Paid::Internal::Types::Enum

      NONE = "none"
      PRORATE = "prorate"
      SIGNALS_FROM_AMENDMENT = "signalsFromAmendment"
      ALL_SIGNALS_IN_PERIOD = "allSignalsInPeriod"
    end
  end
end
