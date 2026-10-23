# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PaymentAllocation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"

      field :invoice_id, -> { String }, optional: false, nullable: false, api_name: "invoiceId"

      field :invoice_line_id, -> { String }, optional: false, nullable: false, api_name: "invoiceLineId"

      field :amount, -> { Integer }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :type, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :allocation_date, -> { String }, optional: false, nullable: false, api_name: "allocationDate"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
