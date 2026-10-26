# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerAPIKeyCreatedStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      REVOKED = "REVOKED"
      EXPIRED = "EXPIRED"
    end
  end
end
