# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module SignalSummaryResponseInterval
      extend Paid::Internal::Types::Enum

      HOUR = "hour"
      DAY = "day"
      WEEK = "week"
      MONTH = "month"
    end
  end
end
