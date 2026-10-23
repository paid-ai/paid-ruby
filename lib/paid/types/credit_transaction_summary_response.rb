# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditTransactionSummaryResponse < Internal::Types::Model
      field :type, -> { Paid::Types::CreditTransactionSummaryResponseType }, optional: false, nullable: false

      field :group_by, -> { Paid::Types::CreditTransactionSummaryResponseGroupBy }, optional: false, nullable: false, api_name: "groupBy"

      field :interval, -> { Paid::Types::CreditTransactionSummaryResponseInterval }, optional: false, nullable: false

      field :data, -> { Internal::Types::Array[Paid::Types::CreditTransactionSummaryBucket] }, optional: false, nullable: false
    end
  end
end
