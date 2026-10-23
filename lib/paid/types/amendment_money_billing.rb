# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentMoneyBilling
      extend Paid::Internal::Types::Enum

      INLINE = "inline"
      NEXT_RUN = "nextRun"
    end
  end
end
