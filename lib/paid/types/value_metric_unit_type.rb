# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueMetricUnitType
      extend Paid::Internal::Types::Enum

      MONETARY = "monetary"
      DURATION = "duration"
      CUSTOM = "custom"
    end
  end
end
