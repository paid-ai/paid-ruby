# frozen_string_literal: true

module Paid
  module Payments
    module Types
      class CreatePaymentRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :amount, -> { Integer }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :payment_date, -> { String }, optional: true, nullable: false, api_name: "paymentDate"

        field :payment_type, -> { Paid::Types::PaymentType }, optional: false, nullable: false, api_name: "paymentType"

        field :status, -> { Paid::Types::PaymentCreateStatus }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end
