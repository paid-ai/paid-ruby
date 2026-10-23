# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CheckoutStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "active"
      COMPLETED = "completed"
      EXPIRED = "expired"
      ARCHIVED = "archived"
    end
  end
end
