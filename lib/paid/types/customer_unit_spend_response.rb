# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitSpendResponse < Internal::Types::Model
      field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :window, -> { Paid::Types::CustomerUnitSpendWindow }, optional: false, nullable: false

      field :spent, -> { Float }, optional: false, nullable: false
    end
  end
end
