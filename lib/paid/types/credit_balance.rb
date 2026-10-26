# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditBalance < Internal::Types::Model
      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :currency_name, -> { String }, optional: false, nullable: false, api_name: "currencyName"

      field :currency_key, -> { String }, optional: false, nullable: false, api_name: "currencyKey"

      field :available, -> { Float }, optional: false, nullable: false

      field :used, -> { Float }, optional: false, nullable: false

      field :total, -> { Float }, optional: false, nullable: false

      field :period_start, -> { String }, optional: false, nullable: true, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: true, api_name: "periodEnd"

      field :rollover_end_date, -> { String }, optional: false, nullable: true, api_name: "rolloverEndDate"

      field :recipient, -> { Paid::Types::CreditBalanceRecipient }, optional: false, nullable: false

      field :grants, -> { Internal::Types::Array[Paid::Types::CreditGrant] }, optional: false, nullable: false
    end
  end
end
