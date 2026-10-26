# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      module GetCustomViewDataRequestPeriodKind
        extend Paid::Internal::Types::Enum

        RELATIVE = "relative"
        ABSOLUTE = "absolute"
      end
    end
  end
end
