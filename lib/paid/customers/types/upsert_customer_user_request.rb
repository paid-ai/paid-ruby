# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class UpsertCustomerUserRequest < Internal::Types::Model
        field :customer_external_id, -> { String }, optional: false, nullable: false, api_name: "customerExternalId"

        field :user_external_id, -> { String }, optional: false, nullable: false, api_name: "userExternalId"

        field :name, -> { String }, optional: true, nullable: false

        field :email, -> { String }, optional: true, nullable: true

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

        field :status, -> { Paid::Types::CustomerUserStatus }, optional: true, nullable: false
      end
    end
  end
end
