# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Orders
    module Types
      module OrderStatusFilter
        extend Paid::Internal::Types::Enum

        DRAFT = "draft"
        PAUSED = "paused"
        ACTIVE = "active"
        ENDED = "ended"
      end
    end
  end
end
