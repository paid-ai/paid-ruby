# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnit < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :customer_id, -> { String }, optional: false, nullable: true, api_name: "customerId"

      field :customer_external_id, -> { String }, optional: false, nullable: true, api_name: "customerExternalId"

      field :name, -> { String }, optional: false, nullable: false

      field :external_type, -> { String }, optional: false, nullable: true, api_name: "externalType"

      field :status, -> { Paid::Types::CustomerUnitStatus }, optional: false, nullable: false

      field :parent_external_id, -> { String }, optional: false, nullable: true, api_name: "parentExternalId"

      field :is_root, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isRoot"

      field :billable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :effective_billable, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "effectiveBillable"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
