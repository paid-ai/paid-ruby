# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Signals
    module Types
      module GetSignalSummaryRequestInterval
        extend Paid::Internal::Types::Enum

        HOUR = "hour"
        DAY = "day"
        WEEK = "week"
        MONTH = "month"
      end
    end
  end
end
