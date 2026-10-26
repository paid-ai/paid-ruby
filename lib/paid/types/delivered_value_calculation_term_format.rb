# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module DeliveredValueCalculationTermFormat
      extend Paid::Internal::Types::Enum

      PERCENT = "percent"
      DURATION = "duration"
    end
  end
end
