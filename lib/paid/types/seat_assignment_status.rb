# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module SeatAssignmentStatus
      extend Paid::Internal::Types::Enum

      ASSIGNED = "assigned"
      UNASSIGNED = "unassigned"
    end
  end
end
