# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerAlias < Internal::Types::Model
      field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :customer_unit_external_id, -> { String }, optional: false, nullable: true, api_name: "customerUnitExternalId"

      field :name, -> { String }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
