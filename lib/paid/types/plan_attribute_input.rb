# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PlanAttributeInput < Internal::Types::Model
      field :product_attribute_id, -> { String }, optional: false, nullable: false, api_name: "productAttributeId"

      field :pricing, -> { Paid::Types::ProductPricingInput }, optional: false, nullable: false

      field :credit_benefits, -> { Internal::Types::Array[Paid::Types::ProductCreditBenefitInput] }, optional: true, nullable: false, api_name: "creditBenefits"
    end
  end
end
