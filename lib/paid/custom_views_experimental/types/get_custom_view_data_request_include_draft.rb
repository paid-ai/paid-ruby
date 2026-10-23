# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      module GetCustomViewDataRequestIncludeDraft
        extend Paid::Internal::Types::Enum

        TRUE = "true"
        FALSE = "false"
      end
    end
  end
end
