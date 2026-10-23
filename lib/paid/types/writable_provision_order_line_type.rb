# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module WritableProvisionOrderLineType
      extend Paid::Internal::Types::Enum

      STANDARD = "STANDARD"
      CREDIT = "CREDIT"
    end
  end
end
