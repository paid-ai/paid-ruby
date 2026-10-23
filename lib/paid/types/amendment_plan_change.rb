# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentPlanChange
      extend Paid::Internal::Types::Enum

      ADDED = "added"
      ENDED = "ended"
      REPLACED = "replaced"
      LINE_TERM_CHANGED = "lineTermChanged"
      ORDER_TERM_CHANGED = "orderTermChanged"
    end
  end
end
