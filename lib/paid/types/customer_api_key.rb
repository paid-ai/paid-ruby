# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerAPIKey < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :customer_id, -> { String }, optional: false, nullable: true, api_name: "customerId"

      field :customer_external_id, -> { String }, optional: false, nullable: true, api_name: "customerExternalId"

      field :scopes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :key_prefix, -> { String }, optional: false, nullable: false, api_name: "keyPrefix"

      field :last4, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::CustomerAPIKeyStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :last_used_at, -> { String }, optional: false, nullable: true, api_name: "lastUsedAt"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :revoked_at, -> { String }, optional: false, nullable: true, api_name: "revokedAt"
    end
  end
end
