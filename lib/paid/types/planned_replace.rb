# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Attribute superseded by a new configuration.
    class PlannedReplace < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :new_quantity, -> { Integer }, optional: false, nullable: false, api_name: "newQuantity"

      field :new_pricing, -> { Object }, optional: true, nullable: false, api_name: "newPricing"

      field :new_end_date, -> { String }, optional: true, nullable: false, api_name: "newEndDate"

      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"
    end
  end
end
