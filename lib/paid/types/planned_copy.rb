# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # An untouched sibling attribute carried to the successor line of an end or replace on the same line. Derived by the
    # planner, never requested.
    class PlannedCopy < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"
    end
  end
end
