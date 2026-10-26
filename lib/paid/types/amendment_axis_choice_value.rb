# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentAxisChoiceValue
      extend Paid::Internal::Types::Enum

      NONE = "none"
      PRORATE = "prorate"
      SIGNALS_FROM_AMENDMENT = "signalsFromAmendment"
      ALL_SIGNALS_IN_PERIOD = "allSignalsInPeriod"
      PRORATED = "prorated"
      FULL = "full"
    end
  end
end
