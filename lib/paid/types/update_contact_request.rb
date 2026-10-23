# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdateContactRequest < Internal::Types::Model
      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

      field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"

      field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"

      field :email, -> { String }, optional: true, nullable: false

      field :phone, -> { String }, optional: true, nullable: true

      field :billing_address, -> { Paid::Types::ContactBillingAddress }, optional: true, nullable: true, api_name: "billingAddress"

      field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

      field :roles, -> { Internal::Types::Array[Paid::Types::UpdateContactRequestRolesItem] }, optional: true, nullable: false
    end
  end
end
