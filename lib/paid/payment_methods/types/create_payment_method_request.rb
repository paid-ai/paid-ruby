# frozen_string_literal: true

module Paid
  module PaymentMethods
    module Types
      class CreatePaymentMethodRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :confirmation_token, -> { String }, optional: false, nullable: false, api_name: "confirmationToken"

        field :return_url, -> { String }, optional: true, nullable: false, api_name: "returnUrl"

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
