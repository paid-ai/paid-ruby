# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CreateOrderLineAttributeRequestPricingPricingModel
      extend Paid::Internal::Types::Enum

      PER_UNIT = "perUnit"
      VOLUME_PRICING = "volumePricing"
      GRADUATED_PRICING = "graduatedPricing"
      PREPAID_CREDITS = "prepaidCredits"
      BRACKETED_PREPAID_CREDITS = "bracketedPrepaidCredits"
      FLAT = "flat"
    end
  end
end
