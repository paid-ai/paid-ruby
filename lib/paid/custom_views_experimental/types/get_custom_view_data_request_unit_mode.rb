# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      module GetCustomViewDataRequestUnitMode
        extend Paid::Internal::Types::Enum

        ALL = "all"
        DIRECT = "direct"
        SUBTREE = "subtree"
      end
    end
  end
end
