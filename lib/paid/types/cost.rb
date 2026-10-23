# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Cost < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :type

      member -> { Paid::Types::PrecomputedCost }, key: "COST"

      member -> { Paid::Types::UsageCost }, key: "USAGE"
    end
  end
end
