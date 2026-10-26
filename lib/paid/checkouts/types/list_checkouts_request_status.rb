# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Checkouts
    module Types
      module ListCheckoutsRequestStatus
        extend Paid::Internal::Types::Enum

        ACTIVE = "active"
        COMPLETED = "completed"
        ARCHIVED = "archived"
      end
    end
  end
end
