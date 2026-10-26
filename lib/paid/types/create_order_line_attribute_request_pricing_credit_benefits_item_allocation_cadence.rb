# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CreateOrderLineAttributeRequestPricingCreditBenefitsItemAllocationCadence
      extend Paid::Internal::Types::Enum

      UPFRONT = "upfront"
      MONTHLY = "monthly"
      QUARTERLY = "quarterly"
      SEMI_ANNUALLY = "semi_annually"
    end
  end
end
