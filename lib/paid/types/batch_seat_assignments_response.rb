# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class BatchSeatAssignmentsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::OrderSeat] }, optional: false, nullable: false
    end
  end
end
