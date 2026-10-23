# frozen_string_literal: true

module Paid
  module Pricing
    module Types
      class ListPricingRequest < Internal::Types::Model
        field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"
      end
    end
  end
end
