# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Contact < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :first_name, -> { String }, optional: false, nullable: false, api_name: "firstName"

      field :last_name, -> { String }, optional: false, nullable: false, api_name: "lastName"

      field :email, -> { String }, optional: false, nullable: false

      field :phone, -> { String }, optional: false, nullable: true

      field :billing_address, -> { Paid::Types::ContactBillingAddress }, optional: true, nullable: true, api_name: "billingAddress"

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :roles, -> { Internal::Types::Array[Paid::Types::ContactRolesItem] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
