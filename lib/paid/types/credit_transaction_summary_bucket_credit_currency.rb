# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Credits are counted per currency and never summed across currencies.
    class CreditTransactionSummaryBucketCreditCurrency < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
