# frozen_string_literal: true

module Paid
  module Credits
    module Types
      class ListCreditTransactionsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

        field :credit_currency_key, -> { String }, optional: true, nullable: false, api_name: "creditCurrencyKey"

        field :type, -> { Paid::Credits::Types::ListCreditTransactionsRequestType }, optional: true, nullable: false

        field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"

        field :event_name, -> { String }, optional: true, nullable: false, api_name: "eventName"

        field :created_at_from, -> { String }, optional: true, nullable: false, api_name: "createdAtFrom"

        field :created_at_to, -> { String }, optional: true, nullable: false, api_name: "createdAtTo"
      end
    end
  end
end
