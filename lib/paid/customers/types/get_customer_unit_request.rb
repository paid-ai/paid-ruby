# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerUnitRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"
      end
    end
  end
end
