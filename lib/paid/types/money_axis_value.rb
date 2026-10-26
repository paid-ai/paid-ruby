# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module MoneyAxisValue
      extend Paid::Internal::Types::Enum

      NONE = "none"
      PRORATE = "prorate"
    end
  end
end
