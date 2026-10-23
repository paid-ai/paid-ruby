# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      module UpdateCustomViewPeriodRequestPeriodUnit
        extend Paid::Internal::Types::Enum

        DAY = "day"
        MONTH = "month"
        YEAR = "year"
      end
    end
  end
end
