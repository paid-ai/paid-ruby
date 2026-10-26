# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionCreditBenefitCreditGrantTiming
      extend Paid::Internal::Types::Enum

      ON_ORDER_ACTIVATION = "on_order_activation"
      ON_PAYMENT = "on_payment"
      ON_INVOICE_POSTED = "on_invoice_posted"
    end
  end
end
