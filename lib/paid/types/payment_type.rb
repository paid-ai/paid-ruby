# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module PaymentType
      extend Paid::Internal::Types::Enum

      CREDIT_CARD = "creditCard"
      BANK_TRANSFER = "bankTransfer"
      ACH = "ach"
      CASH = "cash"
      CHECK = "check"
    end
  end
end
