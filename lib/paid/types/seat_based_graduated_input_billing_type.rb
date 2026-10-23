# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module SeatBasedGraduatedInputBillingType
      extend Paid::Internal::Types::Enum

      ADVANCE = "Advance"
      ARREARS = "Arrears"
    end
  end
end
