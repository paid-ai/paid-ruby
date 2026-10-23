# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module UpdatePlanRequestStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "active"
      ARCHIVED = "archived"
    end
  end
end
