# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentIntentKind
      extend Paid::Internal::Types::Enum

      UPDATE_QUANTITY = "updateQuantity"
      UPDATE_PRICING = "updatePricing"
      END_ATTRIBUTE = "endAttribute"
      ADD_ATTRIBUTE = "addAttribute"
      UPDATE_LINE_TERM = "updateLineTerm"
      UPDATE_ORDER_TERM = "updateOrderTerm"
    end
  end
end
