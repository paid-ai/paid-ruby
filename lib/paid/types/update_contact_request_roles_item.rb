# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module UpdateContactRequestRolesItem
      extend Paid::Internal::Types::Enum

      BILLING = "BILLING"
      ACCOUNTS_PAYABLE = "ACCOUNTS_PAYABLE"
    end
  end
end
