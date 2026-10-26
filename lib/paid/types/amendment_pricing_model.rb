# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentPricingModel
      extend Paid::Internal::Types::Enum

      PER_UNIT = "PerUnit"
      VOLUME_PRICING = "VolumePricing"
      GRADUATED_PRICING = "GraduatedPricing"
      PREPAID_CREDITS = "PrepaidCredits"
      BRACKETED_PREPAID_CREDITS = "BracketedPrepaidCredits"
      PERCENT_OF_TOTAL = "PercentOfTotal"
      COST_PLUS = "CostPlus"
    end
  end
end
