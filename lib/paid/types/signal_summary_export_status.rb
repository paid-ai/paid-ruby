# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module SignalSummaryExportStatus
      extend Paid::Internal::Types::Enum

      PENDING = "pending"
      RUNNING = "running"
      SUCCEEDED = "succeeded"
      FAILED = "failed"
    end
  end
end
