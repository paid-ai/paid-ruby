# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProductRecurringVolumeInputBillingType
      extend Paid::Internal::Types::Enum

      ADVANCE = "Advance"
      ARREARS = "Arrears"
    end
  end
end
