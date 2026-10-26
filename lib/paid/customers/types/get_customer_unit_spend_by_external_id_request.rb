# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerUnitSpendByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

        field :start, -> { String }, optional: true, nullable: false

        field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
      end
    end
  end
end
