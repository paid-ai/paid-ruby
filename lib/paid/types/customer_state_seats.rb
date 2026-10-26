# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateSeats < Internal::Types::Model
      field :total, -> { Integer }, optional: false, nullable: false

      field :assigned, -> { Integer }, optional: false, nullable: false

      field :unassigned, -> { Integer }, optional: false, nullable: false

      field :data, -> { Internal::Types::Array[Paid::Types::CustomerStateSeat] }, optional: false, nullable: false
    end
  end
end
