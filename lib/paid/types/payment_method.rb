# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PaymentMethod < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :external_payment_method_id, -> { String }, optional: false, nullable: false, api_name: "externalPaymentMethodId"

      field :type, -> { String }, optional: false, nullable: false

      field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isDefault"

      field :card, -> { Paid::Types::PaymentMethodCard }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
