# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerFundingInstructionsAccountType
      extend Paid::Internal::Types::Enum

      CHECKING = "checking"
    end
  end
end
