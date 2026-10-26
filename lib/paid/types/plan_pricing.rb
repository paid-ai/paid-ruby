# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Pricing configuration for a plan attribute. Money amounts are expressed in cents.
    class PlanPricing < Internal::Types::Model
      field :pricing_type, -> { Paid::Types::PlanPricingPricingType }, optional: false, nullable: true, api_name: "pricingType"

      field :charge_type, -> { String }, optional: false, nullable: false, api_name: "chargeType"

      field :pricing_model, -> { String }, optional: false, nullable: false, api_name: "pricingModel"

      field :price_points, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
