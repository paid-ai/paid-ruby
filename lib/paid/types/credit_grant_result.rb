# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditGrantResult < Internal::Types::Model
      field :amount, -> { Integer }, optional: false, nullable: false

      field :amount_decimal, -> { String }, optional: false, nullable: false, api_name: "amountDecimal"

      field :starts_at, -> { String }, optional: false, nullable: false, api_name: "startsAt"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :status, -> { Paid::Types::CreditGrantResultStatus }, optional: false, nullable: false
    end
  end
end
