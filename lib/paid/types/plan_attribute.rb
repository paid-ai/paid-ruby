# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PlanAttribute < Internal::Types::Model
      field :product_attribute_id, -> { String }, optional: false, nullable: false, api_name: "productAttributeId"

      field :name, -> { String }, optional: false, nullable: false

      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :pricing, -> { Paid::Types::PlanPricing }, optional: false, nullable: true

      field :credit_benefits, -> { Internal::Types::Array[Paid::Types::PlanCreditBenefit] }, optional: false, nullable: false, api_name: "creditBenefits"
    end
  end
end
