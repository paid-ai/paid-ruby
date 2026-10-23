# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Mutually exclusive with orderId. Provide at most one.
    class SyncValueReceiptRequestProduct < Internal::Types::Model
      field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
