# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Credits
    module Types
      module ListCreditCurrenciesRequestStatus
        extend Paid::Internal::Types::Enum

        ACTIVE = "active"
        ARCHIVED = "archived"
        ALL = "all"
      end
    end
  end
end
