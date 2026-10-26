# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module DeliveredValue
    module Types
      module GetDeliveredValueSummaryRequestGroupBy
        extend Paid::Internal::Types::Enum

        VALUE_METRIC = "valueMetric"
        DIMENSION = "dimension"
        FORMULA_CONDITION = "formulaCondition"
        SIGNAL = "signal"
      end
    end
  end
end
