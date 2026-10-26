# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProductOneTimePerUnitInputFeeType
      extend Paid::Internal::Types::Enum

      SETUP = "setup"
      ONBOARDING = "onboarding"
      IMPLEMENTATION = "implementation"
      MIGRATION = "migration"
      CUSTOM = "custom"
    end
  end
end
