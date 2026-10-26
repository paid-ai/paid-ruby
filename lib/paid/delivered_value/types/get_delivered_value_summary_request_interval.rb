# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module DeliveredValue
    module Types
      module GetDeliveredValueSummaryRequestInterval
        extend Paid::Internal::Types::Enum

        HOUR = "hour"
        DAY = "day"
        WEEK = "week"
        MONTH = "month"
        QUARTER = "quarter"
      end
    end
  end
end
