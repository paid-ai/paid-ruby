# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class GrantCustomerCreditsResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :customer, -> { Paid::Types::CreditGrantCustomer }, optional: false, nullable: false

      field :credit_currency, -> { Paid::Types::CreditGrantCurrency }, optional: false, nullable: false, api_name: "creditCurrency"

      field :grant, -> { Paid::Types::CreditGrantResult }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
