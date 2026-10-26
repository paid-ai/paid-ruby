# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProductUsageCostPlusInputBillingFrequency
      extend Paid::Internal::Types::Enum

      MONTHLY = "Monthly"
      QUARTERLY = "Quarterly"
      SEMI_ANNUALLY = "Semi-Annually"
      ANNUAL = "Annual"
      CUSTOM = "Custom"
    end
  end
end
