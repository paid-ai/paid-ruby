# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerUnitStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      DELETED = "DELETED"
      DRAFT = "DRAFT"
    end
  end
end
