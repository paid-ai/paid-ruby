# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionOrderPaymentTerms
      extend Paid::Internal::Types::Enum

      DUE_ON_RECEIPT = "DueOnReceipt"
      NET15 = "Net15"
      NET30 = "Net30"
      NET45 = "Net45"
      NET60 = "Net60"
      NET90 = "Net90"
    end
  end
end
