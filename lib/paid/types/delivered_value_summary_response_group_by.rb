# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module DeliveredValueSummaryResponseGroupBy
      extend Paid::Internal::Types::Enum

      VALUE_METRIC = "valueMetric"
      DIMENSION = "dimension"
      FORMULA_CONDITION = "formulaCondition"
      SIGNAL = "signal"
    end
  end
end
