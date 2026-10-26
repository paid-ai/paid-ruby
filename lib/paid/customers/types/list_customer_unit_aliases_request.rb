# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class ListCustomerUnitAliasesRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
