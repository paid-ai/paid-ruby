# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "active"
      CHURNED = "churned"
    end
  end
end
