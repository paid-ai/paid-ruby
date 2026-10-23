# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionContact < Internal::Types::Model
      field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"

      field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"

      field :email, -> { String }, optional: true, nullable: false

      field :phone, -> { String }, optional: true, nullable: true

      field :billing_address, -> { Paid::Types::ContactBillingAddress }, optional: true, nullable: true, api_name: "billingAddress"

      field :roles, -> { Internal::Types::Array[Paid::Types::ProvisionContactRolesItem] }, optional: true, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"
    end
  end
end
