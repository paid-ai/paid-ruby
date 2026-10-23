# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitZero < Internal::Types::Model
      field :type, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitZeroType }, optional: false, nullable: false
    end
  end
end
