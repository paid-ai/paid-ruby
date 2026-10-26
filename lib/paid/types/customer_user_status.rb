# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerUserStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "active"
      DEACTIVATED = "deactivated"
    end
  end
end
