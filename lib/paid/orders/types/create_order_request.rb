# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class CreateOrderRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

        field :billing_customer_id, -> { String }, optional: true, nullable: false, api_name: "billingCustomerId"

        field :billing_contact_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "billingContactIds"

        field :name, -> { String }, optional: true, nullable: false

        field :start_date, -> { String }, optional: true, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

        field :subscription_terms, -> { Integer }, optional: true, nullable: false, api_name: "subscriptionTerms"

        field :creation_state, -> { Paid::Types::OrderCreationState }, optional: true, nullable: false, api_name: "creationState"

        field :billing_anchor, -> { Integer }, optional: true, nullable: false, api_name: "billingAnchor"

        field :payment_terms, -> { Paid::Orders::Types::CreateOrderRequestPaymentTerms }, optional: true, nullable: false, api_name: "paymentTerms"

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :currency, -> { String }, optional: true, nullable: false

        field :auto_post_invoices, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoPostInvoices"

        field :auto_send_billing_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoSendBillingEmails"

        field :auto_send_payment_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoSendPaymentEmails"

        field :lines, -> { Internal::Types::Array[Paid::Types::CreateOrderLineRequest] }, optional: true, nullable: false

        field :billing_frequency_override, -> { Paid::Types::OrderBillingFrequencyOverride }, optional: true, nullable: false, api_name: "billingFrequencyOverride"

        field :purchase_order_reference, -> { String }, optional: true, nullable: true, api_name: "purchaseOrderReference"
      end
    end
  end
end
