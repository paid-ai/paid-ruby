# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionProductAttributesItemPricingPricingModel
      extend Paid::Internal::Types::Enum

      PER_UNIT = "perUnit"
      VOLUME_PRICING = "volumePricing"
      GRADUATED_PRICING = "graduatedPricing"
    end
  end
end
