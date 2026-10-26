# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnit < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitZero }

      member -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnit }

      member -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitType }
    end
  end
end
