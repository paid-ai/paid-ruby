# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueModelContentValueTypesItemCategory
      extend Paid::Internal::Types::Enum

      HVE = "hve"
      TIME = "time"
      COST = "cost"
      REVENUE = "revenue"
      RISK = "risk"
    end
  end
end
