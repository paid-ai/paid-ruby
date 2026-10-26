# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdatePricingIntent < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :new_unit_price_minor, -> { Integer }, optional: true, nullable: false, api_name: "newUnitPriceMinor"

      field :new_pricing, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "newPricing"

      field :new_quantity, -> { Integer }, optional: true, nullable: false, api_name: "newQuantity"

      field :treatment, -> { Paid::Types::UpdatePricingIntentTreatment }, optional: true, nullable: false
    end
  end
end
