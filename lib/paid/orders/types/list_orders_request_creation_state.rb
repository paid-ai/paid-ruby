# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Orders
    module Types
      module ListOrdersRequestCreationState
        extend Paid::Internal::Types::Enum

        DRAFT = "draft"
        ACTIVE = "active"
      end
    end
  end
end
