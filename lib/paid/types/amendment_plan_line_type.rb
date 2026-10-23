# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentPlanLineType
      extend Paid::Internal::Types::Enum

      STANDARD = "STANDARD"
      PRORATION_CREDIT = "PRORATION_CREDIT"
      PRORATION_CHARGE = "PRORATION_CHARGE"
      CREDIT = "CREDIT"
    end
  end
end
