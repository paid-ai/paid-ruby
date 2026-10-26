# frozen_string_literal: true

module Paid
  module Credits
    module Types
      class GetCreditTransactionSummaryRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

        field :credit_currency_key, -> { String }, optional: true, nullable: false, api_name: "creditCurrencyKey"

        field :type, -> { Paid::Credits::Types::GetCreditTransactionSummaryRequestType }, optional: true, nullable: false

        field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"

        field :event_name, -> { String }, optional: true, nullable: false, api_name: "eventName"

        field :created_at_from, -> { String }, optional: false, nullable: false, api_name: "createdAtFrom"

        field :created_at_to, -> { String }, optional: true, nullable: false, api_name: "createdAtTo"

        field :group_by, -> { Paid::Credits::Types::GetCreditTransactionSummaryRequestGroupBy }, optional: false, nullable: false, api_name: "groupBy"

        field :interval, -> { Paid::Credits::Types::GetCreditTransactionSummaryRequestInterval }, optional: false, nullable: false
      end
    end
  end
end
