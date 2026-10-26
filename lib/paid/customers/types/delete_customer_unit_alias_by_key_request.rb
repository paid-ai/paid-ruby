# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class DeleteCustomerUnitAliasByKeyRequest < Internal::Types::Model
        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"
      end
    end
  end
end
