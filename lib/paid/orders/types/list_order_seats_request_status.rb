# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Orders
    module Types
      module ListOrderSeatsRequestStatus
        extend Paid::Internal::Types::Enum

        ASSIGNED = "assigned"
        UNASSIGNED = "unassigned"
      end
    end
  end
end
