# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductAttributeUpsert < Internal::Types::Model
      field :product_attribute_id, -> { String }, optional: true, nullable: false, api_name: "productAttributeId"

      field :name, -> { String }, optional: false, nullable: false

      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :pricing, -> { Paid::Types::ProductPricingInput }, optional: false, nullable: false

      field :credit_benefits, -> { Internal::Types::Array[Paid::Types::ProductCreditBenefitInput] }, optional: true, nullable: false, api_name: "creditBenefits"

      field :tax_code, -> { String }, optional: true, nullable: true, api_name: "taxCode"
    end
  end
end
