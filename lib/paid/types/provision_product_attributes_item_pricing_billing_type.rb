# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionProductAttributesItemPricingBillingType
      extend Paid::Internal::Types::Enum

      ADVANCE = "advance"
      ARREARS = "arrears"
    end
  end
end
