# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module SignalSummaryExportFormat
      extend Paid::Internal::Types::Enum

      JSON_ = "json"
      CSV = "csv"
    end
  end
end
