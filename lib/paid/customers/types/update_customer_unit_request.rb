# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class UpdateCustomerUnitRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :body, -> { Paid::Types::CustomerUnitUpdate }, optional: false, nullable: false
      end
    end
  end
end
