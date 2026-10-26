# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUser < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :customer_external_id, -> { String }, optional: false, nullable: false, api_name: "customerExternalId"

      field :name, -> { String }, optional: false, nullable: true

      field :email, -> { String }, optional: false, nullable: true

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :status, -> { Paid::Types::CustomerUserStatus }, optional: false, nullable: false

      field :created, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
