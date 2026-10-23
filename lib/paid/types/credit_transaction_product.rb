# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Product this transaction is scoped to. Null for org-wide transactions.
    class CreditTransactionProduct < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
