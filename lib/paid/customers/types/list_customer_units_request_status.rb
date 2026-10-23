# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Customers
    module Types
      module ListCustomerUnitsRequestStatus
        extend Paid::Internal::Types::Enum

        ACTIVE = "ACTIVE"
        DELETED = "DELETED"
        DRAFT = "DRAFT"
      end
    end
  end
end
