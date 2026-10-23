# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomViewDetailPeriodUnit
      extend Paid::Internal::Types::Enum

      DAY = "day"
      MONTH = "month"
      YEAR = "year"
    end
  end
end
