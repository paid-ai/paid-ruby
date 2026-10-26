# frozen_string_literal: true

module Paid
  module Pricing
    module Types
      class GetPricingRequest < Internal::Types::Model
        field :product_attribute_id, -> { String }, optional: false, nullable: false, api_name: "productAttributeId"
      end
    end
  end
end
