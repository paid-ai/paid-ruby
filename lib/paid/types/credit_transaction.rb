# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditTransaction < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer, -> { Paid::Types::CreditTransactionCustomer }, optional: false, nullable: false

      field :credit_currency, -> { Paid::Types::CreditTransactionCurrency }, optional: false, nullable: false, api_name: "creditCurrency"

      field :type, -> { Paid::Types::CreditTransactionType }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :origin_code, -> { String }, optional: false, nullable: false, api_name: "originCode"

      field :event_name, -> { String }, optional: false, nullable: true, api_name: "eventName"

      field :signal_id, -> { String }, optional: false, nullable: true, api_name: "signalId"

      field :order_id, -> { String }, optional: false, nullable: true, api_name: "orderId"

      field :product, -> { Paid::Types::CreditTransactionProduct }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
