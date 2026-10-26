# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdateCustomerRequest < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :legal_name, -> { String }, optional: true, nullable: true, api_name: "legalName"

      field :email, -> { String }, optional: true, nullable: false

      field :phone, -> { String }, optional: true, nullable: false

      field :website, -> { String }, optional: true, nullable: false

      field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

      field :billing_address, -> { Paid::Types::CustomerBillingAddressInput }, optional: true, nullable: true, api_name: "billingAddress"

      field :creation_state, -> { Paid::Types::CustomerCreationState }, optional: true, nullable: false, api_name: "creationState"

      field :churn_date, -> { String }, optional: true, nullable: true, api_name: "churnDate"

      field :vat_number, -> { String }, optional: true, nullable: true, api_name: "vatNumber"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true
    end
  end
end
