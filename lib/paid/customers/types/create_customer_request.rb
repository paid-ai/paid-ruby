# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CreateCustomerRequest < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :legal_name, -> { String }, optional: true, nullable: true, api_name: "legalName"

        field :email, -> { String }, optional: true, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :website, -> { String }, optional: true, nullable: false

        field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

        field :billing_address, -> { Paid::Types::CustomerBillingAddressInput }, optional: true, nullable: true, api_name: "billingAddress"

        field :creation_state, -> { Paid::Types::CustomerCreationState }, optional: true, nullable: false, api_name: "creationState"

        field :vat_number, -> { String }, optional: true, nullable: true, api_name: "vatNumber"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

        field :default_currency, -> { String }, optional: true, nullable: false, api_name: "defaultCurrency"
      end
    end
  end
end
