# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Payments
    module Types
      module ListPaymentsRequestStatus
        extend Paid::Internal::Types::Enum

        DRAFT = "draft"
        POSTED = "posted"
        PROCESSING = "processing"
        REQUIRES_ACTION = "requiresAction"
        FAILED = "failed"
        CANCELED = "canceled"
      end
    end
  end
end
