# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionCreditBenefitRolloverDurationUnit
      extend Paid::Internal::Types::Enum

      DAYS = "days"
      MONTHS = "months"
    end
  end
end
