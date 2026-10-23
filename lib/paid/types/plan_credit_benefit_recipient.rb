# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module PlanCreditBenefitRecipient
      extend Paid::Internal::Types::Enum

      ORGANIZATION = "organization"
      SEAT = "seat"
    end
  end
end
