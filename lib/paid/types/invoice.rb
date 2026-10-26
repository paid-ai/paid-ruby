# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Invoice < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :display_number, -> { String }, optional: true, nullable: true, api_name: "displayNumber"

      field :order_id, -> { String }, optional: true, nullable: true, api_name: "orderId"

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :status, -> { Paid::Types::InvoiceStatus }, optional: false, nullable: false

      field :payment_status, -> { Paid::Types::InvoicePaymentStatus }, optional: false, nullable: false, api_name: "paymentStatus"

      field :source, -> { Paid::Types::InvoiceSource }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: true, nullable: true, api_name: "endDate"

      field :issue_date, -> { String }, optional: false, nullable: false, api_name: "issueDate"

      field :posted_date, -> { String }, optional: true, nullable: true, api_name: "postedDate"

      field :due_date, -> { String }, optional: true, nullable: true, api_name: "dueDate"

      field :currency, -> { String }, optional: false, nullable: false

      field :tax_amount, -> { Float }, optional: false, nullable: false, api_name: "taxAmount"

      field :tax_rate, -> { Float }, optional: false, nullable: false, api_name: "taxRate"

      field :tax_status, -> { Paid::Types::InvoiceTaxStatus }, optional: false, nullable: false, api_name: "taxStatus"

      field :invoice_total_excluding_tax, -> { Float }, optional: false, nullable: false, api_name: "invoiceTotalExcludingTax"

      field :invoice_total, -> { Float }, optional: false, nullable: false, api_name: "invoiceTotal"

      field :amount_due, -> { Float }, optional: false, nullable: false, api_name: "amountDue"

      field :amount_paid, -> { Float }, optional: false, nullable: false, api_name: "amountPaid"

      field :amount_remaining, -> { Float }, optional: false, nullable: false, api_name: "amountRemaining"

      field :credit_notes_total, -> { Float }, optional: false, nullable: false, api_name: "creditNotesTotal"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :payment_link, -> { String }, optional: true, nullable: true, api_name: "paymentLink"

      field :dispute_link, -> { String }, optional: true, nullable: true, api_name: "disputeLink"

      field :public_url_token, -> { String }, optional: true, nullable: true, api_name: "publicUrlToken"

      field :tax_exempt, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "taxExempt"

      field :billing_contact_id, -> { String }, optional: true, nullable: true, api_name: "billingContactId"

      field :purchase_order_reference, -> { String }, optional: true, nullable: true, api_name: "purchaseOrderReference"
    end
  end
end
