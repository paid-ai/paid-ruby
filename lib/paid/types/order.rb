# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Order < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :billing_customer_id, -> { String }, optional: false, nullable: true, api_name: "billingCustomerId"

      field :billing_contact_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "billingContactIds"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :end_date, -> { String }, optional: false, nullable: true, api_name: "endDate"

      field :name, -> { String }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :subscription_terms, -> { Integer }, optional: false, nullable: true, api_name: "subscriptionTerms"

      field :billed_amount_no_tax, -> { Float }, optional: false, nullable: false, api_name: "billedAmountNoTax"

      field :billed_tax, -> { Float }, optional: false, nullable: false, api_name: "billedTax"

      field :estimated_tax, -> { Float }, optional: false, nullable: false, api_name: "estimatedTax"

      field :order_amount, -> { Float }, optional: false, nullable: false, api_name: "orderAmount"

      field :pending_billing_amount, -> { Float }, optional: false, nullable: false, api_name: "pendingBillingAmount"

      field :total_amount, -> { Float }, optional: false, nullable: false, api_name: "totalAmount"

      field :total_billed_amount, -> { Float }, optional: false, nullable: false, api_name: "totalBilledAmount"

      field :creation_state, -> { Paid::Types::OrderCreationState }, optional: false, nullable: false, api_name: "creationState"

      field :payment_terms, -> { String }, optional: false, nullable: true, api_name: "paymentTerms"

      field :number, -> { Float }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :show_payment_link, -> { Internal::Types::Boolean }, optional: false, nullable: true, api_name: "showPaymentLink"

      field :show_bank_details, -> { Internal::Types::Boolean }, optional: false, nullable: true, api_name: "showBankDetails"

      field :auto_post_invoices, -> { Internal::Types::Boolean }, optional: false, nullable: true, api_name: "autoPostInvoices"

      field :auto_send_billing_emails, -> { Internal::Types::Boolean }, optional: false, nullable: true, api_name: "autoSendBillingEmails"

      field :auto_send_payment_emails, -> { Internal::Types::Boolean }, optional: false, nullable: true, api_name: "autoSendPaymentEmails"

      field :version, -> { Integer }, optional: false, nullable: false

      field :billing_frequency_overridden, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "billingFrequencyOverridden"

      field :billing_frequency_override, -> { Paid::Types::OrderBillingFrequencyOverride }, optional: true, nullable: false, api_name: "billingFrequencyOverride"

      field :purchase_order_reference, -> { String }, optional: false, nullable: true, api_name: "purchaseOrderReference"
    end
  end
end
