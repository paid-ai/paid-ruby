# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CustomerUnitCreateUnderParent < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :name, -> { String }, optional: true, nullable: false

        field :external_type, -> { String }, optional: true, nullable: false, api_name: "externalType"

        field :parent_external_id, -> { String }, optional: false, nullable: false, api_name: "parentExternalId"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

        field :billable, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
