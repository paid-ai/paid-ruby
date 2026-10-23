# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerFundingInstructions < Internal::Types::Model
      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :currency, -> { String }, optional: false, nullable: false

      field :bank_name, -> { String }, optional: false, nullable: false, api_name: "bankName"

      field :account_holder_name, -> { String }, optional: false, nullable: false, api_name: "accountHolderName"

      field :routing_number, -> { String }, optional: false, nullable: false, api_name: "routingNumber"

      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"

      field :account_type, -> { Paid::Types::CustomerFundingInstructionsAccountType }, optional: false, nullable: false, api_name: "accountType"

      field :status, -> { String }, optional: false, nullable: false

      field :memo, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
