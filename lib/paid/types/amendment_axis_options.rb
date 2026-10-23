# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentAxisOptions < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :axis

      member -> { Paid::Types::MoneyAxisOptions }, key: "MONEY"

      member -> { Paid::Types::UsageAttributionAxisOptions }, key: "USAGE_ATTRIBUTION"

      member -> { Paid::Types::ChargeStubAxisOptions }, key: "CHARGE_STUB"

      member -> { Paid::Types::CreditGrantAxisOptions }, key: "CREDIT_GRANT"
    end
  end
end
