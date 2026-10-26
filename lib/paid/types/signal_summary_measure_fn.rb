# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module SignalSummaryMeasureFn
      extend Paid::Internal::Types::Enum

      COUNT = "count"
      SUM = "sum"
      MIN = "min"
      MAX = "max"
      AVG = "avg"
    end
  end
end
