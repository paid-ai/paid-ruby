# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionContactRolesItem
      extend Paid::Internal::Types::Enum

      BILLING = "BILLING"
      ACCOUNTS_PAYABLE = "ACCOUNTS_PAYABLE"
    end
  end
end
