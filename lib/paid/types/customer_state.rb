# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerState < Internal::Types::Model
      field :customer, -> { Paid::Types::CustomerStateCustomer }, optional: false, nullable: false

      field :default_currency, -> { String }, optional: false, nullable: false, api_name: "defaultCurrency"

      field :orders, -> { Internal::Types::Array[Paid::Types::CustomerStateOrder] }, optional: false, nullable: false

      field :seats, -> { Paid::Types::CustomerStateSeats }, optional: false, nullable: false

      field :checkout_links, -> { Internal::Types::Array[Paid::Types::CustomerStateCheckoutLink] }, optional: false, nullable: false, api_name: "checkoutLinks"

      field :credits, -> { Paid::Types::CustomerStateCreditSummary }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false
    end
  end
end
