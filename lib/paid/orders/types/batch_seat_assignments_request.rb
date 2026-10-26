# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class BatchSeatAssignmentsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :assignments, -> { Internal::Types::Array[Paid::Orders::Types::BatchSeatAssignmentsRequestAssignmentsItem] }, optional: false, nullable: false
      end
    end
  end
end
