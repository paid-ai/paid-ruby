# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProductTieredPricePointTiersItemTierBillingType
      extend Paid::Internal::Types::Enum

      FLAT = "flat"
      PER_UNIT = "perUnit"
    end
  end
end
