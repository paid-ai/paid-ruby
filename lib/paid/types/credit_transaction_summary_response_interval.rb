# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CreditTransactionSummaryResponseInterval
      extend Paid::Internal::Types::Enum

      DAY = "day"
      WEEK = "week"
      MONTH = "month"
    end
  end
end
