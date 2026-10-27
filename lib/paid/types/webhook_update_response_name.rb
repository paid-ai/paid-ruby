# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module WebhookUpdateResponseName
      extend Paid::Internal::Types::Enum

      BILLING_INVOICE_PAID = "billing-invoice-paid"
      BILLING_INVOICE_POSTED = "billing-invoice-posted"
      BILLING_CHECKOUT_CREATED = "billing-checkout-created"
      BILLING_CHECKOUT_COMPLETED = "billing-checkout-completed"
      BILLING_CHECKOUT_EXPIRED = "billing-checkout-expired"
      BILLING_PAYMENT_SUCCEEDED = "billing-payment-succeeded"
      BILLING_PAYMENT_FAILED = "billing-payment-failed"
      BILLING_CREDITS_DEPLETED = "billing-credits-depleted"
      BILLING_OVERAGE_INCURRED = "billing-overage-incurred"
      BILLING_CREDIT_CAP_REACHED = "billing-credit-cap-reached"
    end
  end
end
