# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditGrantAddAxisOptionsOptionsItem < Internal::Types::Model
      field :value, -> { Paid::Types::CreditGrantValue }, optional: false, nullable: false

      field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isDefault"

      field :unsupported_reason, -> { String }, optional: true, nullable: false, api_name: "unsupportedReason"

      field :requires, -> { Internal::Types::Array[Paid::Types::AmendmentPricingClause] }, optional: true, nullable: false
    end
  end
end
