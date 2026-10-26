# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionProductAttributesItemPricingChargeType
      extend Paid::Internal::Types::Enum

      USAGE = "usage"
      RECURRING = "recurring"
      ONE_TIME = "oneTime"
      SEAT_BASED = "seatBased"
    end
  end
end
