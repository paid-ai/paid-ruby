# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class UpdateOrderRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :start_date, -> { String }, optional: true, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

        field :subscription_terms, -> { Integer }, optional: true, nullable: false, api_name: "subscriptionTerms"

        field :creation_state, -> { Paid::Types::OrderCreationState }, optional: true, nullable: false, api_name: "creationState"

        field :billing_anchor, -> { Integer }, optional: true, nullable: false, api_name: "billingAnchor"

        field :payment_terms, -> { Paid::Orders::Types::UpdateOrderRequestPaymentTerms }, optional: true, nullable: false, api_name: "paymentTerms"

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :billing_customer_id, -> { String }, optional: true, nullable: false, api_name: "billingCustomerId"

        field :billing_contact_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "billingContactIds"

        field :auto_post_invoices, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoPostInvoices"

        field :auto_send_billing_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoSendBillingEmails"

        field :auto_send_payment_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoSendPaymentEmails"

        field :purchase_order_reference, -> { String }, optional: true, nullable: true, api_name: "purchaseOrderReference"
      end
    end
  end
end
