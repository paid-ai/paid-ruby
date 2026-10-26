# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Monthly UTC boundaries: an anchored day, or the first of each calendar month.
    class CustomerUnitCapSchedule < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::CustomerUnitCapScheduleAnchorDay }

      member -> { Paid::Types::CustomerUnitCapScheduleOne }
    end
  end
end
