# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module InvoiceSource
      extend Paid::Internal::Types::Enum

      ORDER_BASED = "order_based"
      MANUAL = "manual"
    end
  end
end
