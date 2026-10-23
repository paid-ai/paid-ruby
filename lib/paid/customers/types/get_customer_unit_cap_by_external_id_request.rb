# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerUnitCapByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"
      end
    end
  end
end
