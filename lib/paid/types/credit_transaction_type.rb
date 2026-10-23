# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CreditTransactionType
      extend Paid::Internal::Types::Enum

      GRANT = "grant"
      SPEND = "spend"
      PENDING_GRANT = "pendingGrant"
    end
  end
end
