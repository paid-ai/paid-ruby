# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateCreditBalance < Internal::Types::Model
      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :currency_name, -> { String }, optional: false, nullable: false, api_name: "currencyName"

      field :currency_key, -> { String }, optional: false, nullable: false, api_name: "currencyKey"

      field :balance, -> { Float }, optional: false, nullable: false
    end
  end
end
