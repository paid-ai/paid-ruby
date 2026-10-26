# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentAxisRelevance
      extend Paid::Internal::Types::Enum

      ALWAYS = "always"
      MID_CYCLE = "midCycle"
    end
  end
end
