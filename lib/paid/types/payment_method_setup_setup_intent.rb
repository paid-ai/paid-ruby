# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The setup intent created with the payment processor.
    class PaymentMethodSetupSetupIntent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :client_secret, -> { String }, optional: false, nullable: true, api_name: "clientSecret"

      field :status, -> { String }, optional: false, nullable: false
    end
  end
end
