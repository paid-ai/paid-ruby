# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Credits
    module Types
      module UpdateCreditCurrencyRequestStatus
        extend Paid::Internal::Types::Enum

        ACTIVE = "active"
        ARCHIVED = "archived"
      end
    end
  end
end
