# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Payment < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :number, -> { Integer }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :invoice_id, -> { String }, optional: false, nullable: true, api_name: "invoiceId"

      field :order_id, -> { String }, optional: false, nullable: true, api_name: "orderId"

      field :amount, -> { Integer }, optional: false, nullable: false

      field :allocated_amount, -> { Integer }, optional: false, nullable: false, api_name: "allocatedAmount"

      field :balance, -> { Integer }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :payment_date, -> { String }, optional: false, nullable: false, api_name: "paymentDate"

      field :payment_type, -> { String }, optional: false, nullable: false, api_name: "paymentType"

      field :status, -> { String }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
