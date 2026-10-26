# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditTransactionSummaryBucket < Internal::Types::Model
      field :period_start, -> { String }, optional: false, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: false, api_name: "periodEnd"

      field :group_key, -> { String }, optional: false, nullable: true, api_name: "groupKey"

      field :credit_currency, -> { Paid::Types::CreditTransactionSummaryBucketCreditCurrency }, optional: false, nullable: false, api_name: "creditCurrency"

      field :credits, -> { String }, optional: false, nullable: false

      field :transaction_count, -> { Integer }, optional: false, nullable: false, api_name: "transactionCount"
    end
  end
end
