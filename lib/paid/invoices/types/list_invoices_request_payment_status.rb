# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Invoices
    module Types
      module ListInvoicesRequestPaymentStatus
        extend Paid::Internal::Types::Enum

        PENDING = "pending"
        PAID = "paid"
        PARTIALLY_PAID = "partiallyPaid"
        OVERDUE = "overdue"
        ERROR = "error"
      end
    end
  end
end
