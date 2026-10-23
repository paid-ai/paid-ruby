# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionOrderLineAttributeDiscountType
      extend Paid::Internal::Types::Enum

      PERCENTAGE = "percentage"
      FIXED = "fixed"
    end
  end
end
