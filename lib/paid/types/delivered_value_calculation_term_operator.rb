# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module DeliveredValueCalculationTermOperator
      extend Paid::Internal::Types::Enum

      MULTIPLY = "×"
      DIVIDE = "÷"
    end
  end
end
