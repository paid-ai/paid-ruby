# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemOperator
      extend Paid::Internal::Types::Enum

      GTE = "gte"
      GT = "gt"
      LT = "lt"
      LTE = "lte"
      EQ = "eq"
      NEQ = "neq"
      CONTAINS = "contains"
      EQ_STRING = "eq_string"
      EQ_BOOL = "eq_bool"
    end
  end
end
