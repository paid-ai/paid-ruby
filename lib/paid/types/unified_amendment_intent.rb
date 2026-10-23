# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UnifiedAmendmentIntent < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :type

      member -> { Paid::Types::UpdateQuantityIntent }, key: "UPDATE_QUANTITY"

      member -> { Paid::Types::UpdatePricingIntent }, key: "UPDATE_PRICING"

      member -> { Paid::Types::EndAttributeIntent }, key: "END_ATTRIBUTE"

      member -> { Paid::Types::AddFromCatalogIntent }, key: "ADD_FROM_CATALOG"

      member -> { Paid::Types::AddAttributeIntent }, key: "ADD_ATTRIBUTE"

      member -> { Paid::Types::UpdateLineTermIntent }, key: "UPDATE_LINE_TERM"

      member -> { Paid::Types::UpdateOrderTermIntent }, key: "UPDATE_ORDER_TERM"
    end
  end
end
