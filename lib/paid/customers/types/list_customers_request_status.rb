# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Customers
    module Types
      module ListCustomersRequestStatus
        extend Paid::Internal::Types::Enum

        ACTIVE = "active"
        CHURNED = "churned"
      end
    end
  end
end
