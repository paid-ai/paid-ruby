# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitCapScheduleInputOne < Internal::Types::Model
      field :type, -> { Paid::Types::CustomerUnitCapScheduleInputOneType }, optional: false, nullable: false
    end
  end
end
