# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module DeliveredValueSummaryResponseInterval
      extend Paid::Internal::Types::Enum

      HOUR = "hour"
      DAY = "day"
      WEEK = "week"
      MONTH = "month"
      QUARTER = "quarter"
    end
  end
end
