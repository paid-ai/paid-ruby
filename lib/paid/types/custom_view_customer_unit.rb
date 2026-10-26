# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewCustomerUnit < Internal::Types::Model
      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :name, -> { String }, optional: false, nullable: false

      field :external_type, -> { String }, optional: false, nullable: true, api_name: "externalType"

      field :parent_external_id, -> { String }, optional: false, nullable: true, api_name: "parentExternalId"

      field :is_root, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isRoot"

      field :billable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :effective_billable, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "effectiveBillable"
    end
  end
end
