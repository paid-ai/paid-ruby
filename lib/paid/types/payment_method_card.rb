# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Card details when the payment method is a card. Null for other types or when details are unavailable.
    class PaymentMethodCard < Internal::Types::Model
      field :brand, -> { String }, optional: false, nullable: false

      field :last4, -> { String }, optional: false, nullable: false

      field :exp_month, -> { Integer }, optional: false, nullable: false, api_name: "expMonth"

      field :exp_year, -> { Integer }, optional: false, nullable: false, api_name: "expYear"
    end
  end
end
