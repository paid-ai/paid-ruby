# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentPlanUsageEffectKind
      extend Paid::Internal::Types::Enum

      MIGRATE_SUMMARIES = "migrateSummaries"
      TRAILING_BILL = "trailingBill"
    end
  end
end
