# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditGrantCreateRequest < Internal::Types::Model
      field :credit_currency_key, -> { String }, optional: false, nullable: false, api_name: "creditCurrencyKey"

      field :amount, -> { Float }, optional: false, nullable: false

      field :starts_at, -> { String }, optional: true, nullable: false, api_name: "startsAt"

      field :expires_at, -> { String }, optional: true, nullable: true, api_name: "expiresAt"

      field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "idempotencyKey"
    end
  end
end
