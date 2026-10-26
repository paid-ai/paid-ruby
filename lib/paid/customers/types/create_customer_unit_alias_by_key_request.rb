# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CreateCustomerUnitAliasByKeyRequest < Internal::Types::Model
        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :body, -> { Paid::Types::CustomerAliasCreateRequest }, optional: false, nullable: false
      end
    end
  end
end
