# frozen_string_literal: true

module Paid
  module Pricing
    module Types
      class UpdatePricingRequest < Internal::Types::Model
        field :product_attribute_id, -> { String }, optional: false, nullable: false, api_name: "productAttributeId"

        field :pricing, -> { Paid::Types::PricingInput }, optional: false, nullable: false

        field :credit_benefits, -> { Internal::Types::Array[Paid::Types::CreditBenefitInput] }, optional: true, nullable: false, api_name: "creditBenefits"
      end
    end
  end
end
