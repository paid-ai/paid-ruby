# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerUnitSpendRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

        field :start, -> { String }, optional: true, nullable: false

        field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
      end
    end
  end
end
