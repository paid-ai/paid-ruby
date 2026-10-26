# frozen_string_literal: true

module Paid
  module Contacts
    module Types
      class CreateContactRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

        field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"

        field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"

        field :email, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: true, nullable: true

        field :billing_address, -> { Paid::Types::ContactBillingAddress }, optional: true, nullable: true, api_name: "billingAddress"

        field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

        field :roles, -> { Internal::Types::Array[Paid::Contacts::Types::CreateContactRequestRolesItem] }, optional: true, nullable: false
      end
    end
  end
end
