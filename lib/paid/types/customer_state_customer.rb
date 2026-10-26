# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateCustomer < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :billing_address, -> { Paid::Types::CustomerBillingAddressResponse }, optional: false, nullable: true, api_name: "billingAddress"
    end
  end
end
