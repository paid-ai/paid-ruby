# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module UsageBracketedPrepaidCreditsInputSignalType
      extend Paid::Internal::Types::Enum

      ACTIVITY = "activity"
      OUTCOME = "outcome"
    end
  end
end
