# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # A cap in force on one of the customer's units, as the customer unit cap read returns it. `used` covers the unit
    # and every unit under it.
    class CustomViewContextCap < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :frequency, -> { Paid::Types::CustomViewContextCapFrequency }, optional: false, nullable: false

      field :schedule, -> { Paid::Types::CustomerUnitCapSchedule }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :credits_currency_key, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyKey"

      field :credits_currency_name, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyName"

      field :current_period, -> { Paid::Types::CustomerUnitCapCurrentPeriod }, optional: false, nullable: true, api_name: "currentPeriod"
    end
  end
end
