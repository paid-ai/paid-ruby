# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Credits
    module Types
      module GetCreditTransactionSummaryRequestInterval
        extend Paid::Internal::Types::Enum

        DAY = "day"
        WEEK = "week"
        MONTH = "month"
      end
    end
  end
end
