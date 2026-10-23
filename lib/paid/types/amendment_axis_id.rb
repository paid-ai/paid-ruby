# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentAxisID
      extend Paid::Internal::Types::Enum

      MONEY = "money"
      USAGE_ATTRIBUTION = "usageAttribution"
      CHARGE_STUB = "chargeStub"
      CREDIT_GRANT = "creditGrant"
    end
  end
end
