# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class DeleteCustomerUnitAliasRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"
      end
    end
  end
end
