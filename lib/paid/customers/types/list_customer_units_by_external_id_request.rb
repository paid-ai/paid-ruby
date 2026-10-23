# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class ListCustomerUnitsByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :status, -> { Paid::Customers::Types::ListCustomerUnitsByExternalIDRequestStatus }, optional: true, nullable: false

        field :external_type, -> { String }, optional: true, nullable: false, api_name: "externalType"

        field :parent_external_id, -> { String }, optional: true, nullable: false, api_name: "parentExternalId"
      end
    end
  end
end
