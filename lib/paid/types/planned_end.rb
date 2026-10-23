# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Attribute the amendment ends.
    class PlannedEnd < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"
    end
  end
end
