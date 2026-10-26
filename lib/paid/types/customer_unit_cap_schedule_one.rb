# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitCapScheduleOne < Internal::Types::Model
      field :type, -> { Paid::Types::CustomerUnitCapScheduleOneType }, optional: false, nullable: false
    end
  end
end
