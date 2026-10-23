# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PendingCreditConsumption < Internal::Types::Model
      field :credits, -> { Integer }, optional: false, nullable: false

      field :credits_decimal, -> { String }, optional: false, nullable: false, api_name: "creditsDecimal"

      field :credit_currency, -> { Paid::Types::PendingCreditConsumptionCurrency }, optional: false, nullable: true, api_name: "creditCurrency"

      field :order_id, -> { String }, optional: false, nullable: true, api_name: "orderId"

      field :event_name, -> { String }, optional: false, nullable: true, api_name: "eventName"

      field :occurred_at, -> { String }, optional: false, nullable: false, api_name: "occurredAt"

      field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"
    end
  end
end
