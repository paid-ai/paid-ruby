# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerUnitCapEndedPolicyFrequency
      extend Paid::Internal::Types::Enum

      MONTHLY = "MONTHLY"
    end
  end
end
