# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PricingResponse < Internal::Types::Model
      field :product_attribute_id, -> { String }, optional: false, nullable: false, api_name: "productAttributeId"

      field :name, -> { String }, optional: false, nullable: false

      field :pricing, -> { Paid::Types::PricingOutput }, optional: false, nullable: true

      field :credit_benefits, -> { Internal::Types::Array[Paid::Types::CreditBenefitOutput] }, optional: false, nullable: false, api_name: "creditBenefits"
    end
  end
end
