# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Customer < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: true, api_name: "legalName"

      field :email, -> { String }, optional: false, nullable: false

      field :phone, -> { String }, optional: false, nullable: false

      field :website, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :billing_address, -> { Paid::Types::CustomerBillingAddressResponse }, optional: false, nullable: true, api_name: "billingAddress"

      field :creation_state, -> { Paid::Types::CustomerCreationState }, optional: false, nullable: false, api_name: "creationState"

      field :status, -> { Paid::Types::CustomerStatus }, optional: false, nullable: false

      field :churn_date, -> { String }, optional: false, nullable: true, api_name: "churnDate"

      field :vat_number, -> { String }, optional: false, nullable: true, api_name: "vatNumber"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :default_currency, -> { String }, optional: false, nullable: false, api_name: "defaultCurrency"

      field :connections, -> { Paid::Types::CustomerConnections }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
