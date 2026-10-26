# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueMetricVariableEditFormatUnit
      extend Paid::Internal::Types::Enum

      SECONDS = "seconds"
      MINUTES = "minutes"
      HOURS = "hours"
      DAYS = "days"
    end
  end
end
