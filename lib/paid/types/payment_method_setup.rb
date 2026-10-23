# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PaymentMethodSetup < Internal::Types::Model
      field :setup_intent, -> { Paid::Types::PaymentMethodSetupSetupIntent }, optional: false, nullable: false, api_name: "setupIntent"

      field :external_payment_method_id, -> { String }, optional: false, nullable: true, api_name: "externalPaymentMethodId"

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"
    end
  end
end
