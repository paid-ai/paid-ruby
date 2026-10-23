# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Contacts
    module Types
      module CreateContactRequestRolesItem
        extend Paid::Internal::Types::Enum

        BILLING = "BILLING"
        ACCOUNTS_PAYABLE = "ACCOUNTS_PAYABLE"
      end
    end
  end
end
