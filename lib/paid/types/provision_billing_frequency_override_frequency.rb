# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionBillingFrequencyOverrideFrequency
      extend Paid::Internal::Types::Enum

      MONTHLY = "monthly"
      QUARTERLY = "quarterly"
      SEMI_ANNUALLY = "semiAnnually"
      ANNUAL = "annual"
      CUSTOM = "custom"
    end
  end
end
