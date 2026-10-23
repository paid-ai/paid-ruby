# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module InvoiceTaxStatus
      extend Paid::Internal::Types::Enum

      NOT_APPLICABLE = "not_applicable"
      CALCULATED = "calculated"
      COMMITTED = "committed"
      FAILED = "failed"
      VOIDED = "voided"
    end
  end
end
