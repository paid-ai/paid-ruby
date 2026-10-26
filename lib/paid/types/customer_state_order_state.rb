# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomerStateOrderState
      extend Paid::Internal::Types::Enum

      DRAFT = "draft"
      ACTIVE = "active"
      PAUSED = "paused"
      ENDED = "ended"
    end
  end
end
