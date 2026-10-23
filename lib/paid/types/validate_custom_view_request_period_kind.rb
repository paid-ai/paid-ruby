# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValidateCustomViewRequestPeriodKind
      extend Paid::Internal::Types::Enum

      RELATIVE = "relative"
      ABSOLUTE = "absolute"
    end
  end
end
