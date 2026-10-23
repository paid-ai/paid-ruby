# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentAddAxisOptions < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :axis

      member -> { Paid::Types::ChargeStubAddAxisOptions }, key: "CHARGE_STUB"

      member -> { Paid::Types::CreditGrantAddAxisOptions }, key: "CREDIT_GRANT"
    end
  end
end
