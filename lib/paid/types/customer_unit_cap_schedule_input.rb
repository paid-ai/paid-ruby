# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Omit to inherit the schedule in force at effectiveFrom. If none applies, use the creation-time UTC day. An
    # explicit change counts spend from the new schedule’s ordinary period start, including earlier spend.
    class CustomerUnitCapScheduleInput < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::CustomerUnitCapScheduleInputAnchorDay }

      member -> { Paid::Types::CustomerUnitCapScheduleInputOne }
    end
  end
end
