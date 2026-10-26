# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class InvoiceLine < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :order_id, -> { String }, optional: false, nullable: true, api_name: "orderId"

      field :order_line_id, -> { String }, optional: false, nullable: true, api_name: "orderLineId"

      field :order_line_attribute_id, -> { String }, optional: false, nullable: true, api_name: "orderLineAttributeId"

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"

      field :payment_status, -> { Paid::Types::InvoiceLinePaymentStatus }, optional: false, nullable: false, api_name: "paymentStatus"

      field :quantity, -> { Integer }, optional: false, nullable: false

      field :total_price_before_tax, -> { Float }, optional: false, nullable: false, api_name: "totalPriceBeforeTax"

      field :tax, -> { Float }, optional: false, nullable: false

      field :tax_rate, -> { Float }, optional: false, nullable: false, api_name: "taxRate"

      field :total_price_after_tax, -> { Float }, optional: false, nullable: false, api_name: "totalPriceAfterTax"

      field :currency, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :balance_amount, -> { Float }, optional: false, nullable: false, api_name: "balanceAmount"

      field :credited_amount, -> { Float }, optional: false, nullable: false, api_name: "creditedAmount"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
