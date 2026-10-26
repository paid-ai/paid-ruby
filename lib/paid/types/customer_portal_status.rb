# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerPortalStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "active"
      EXPIRED = "expired"
    end
  end
end
