# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module PlanCreditBenefitCreditGrantTiming
      extend Paid::Internal::Types::Enum

      ON_PAYMENT = "on_payment"
      ON_INVOICE_POSTED = "on_invoice_posted"
      ON_ORDER_ACTIVATION = "on_order_activation"
    end
  end
end
