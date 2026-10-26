# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module InvoiceStatus
      extend Paid::Internal::Types::Enum

      BUILDING = "building"
      DRAFT = "draft"
      PENDING = "pending"
      POSTED = "posted"
      VOIDED = "voided"
      CANCELED = "canceled"
      ERROR = "error"
    end
  end
end
