# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class ListCustomersRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :status, -> { Paid::Customers::Types::ListCustomersRequestStatus }, optional: true, nullable: false

        field :creation_state, -> { Paid::Customers::Types::ListCustomersRequestCreationState }, optional: true, nullable: false, api_name: "creationState"

        field :created_at_from, -> { String }, optional: true, nullable: false, api_name: "createdAtFrom"

        field :created_at_to, -> { String }, optional: true, nullable: false, api_name: "createdAtTo"

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"
      end
    end
  end
end
