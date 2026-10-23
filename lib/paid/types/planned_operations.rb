# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Structural writes the amendment executes.
    class PlannedOperations < Internal::Types::Model
      field :ends, -> { Internal::Types::Array[Paid::Types::PlannedEnd] }, optional: true, nullable: false

      field :replaces, -> { Internal::Types::Array[Paid::Types::PlannedReplace] }, optional: true, nullable: false

      field :copies, -> { Internal::Types::Array[Paid::Types::PlannedCopy] }, optional: true, nullable: false

      field :adds, -> { Internal::Types::Array[Paid::Types::PlannedAdd] }, optional: true, nullable: false

      field :order_term, -> { Paid::Types::PlannedOrderTerm }, optional: true, nullable: false, api_name: "orderTerm"
    end
  end
end
