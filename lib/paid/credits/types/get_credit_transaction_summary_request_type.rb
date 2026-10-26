# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Credits
    module Types
      module GetCreditTransactionSummaryRequestType
        extend Paid::Internal::Types::Enum

        GRANT = "grant"
        SPEND = "spend"
        PENDING_GRANT = "pendingGrant"
      end
    end
  end
end
