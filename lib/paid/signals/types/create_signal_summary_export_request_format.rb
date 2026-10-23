# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Signals
    module Types
      module CreateSignalSummaryExportRequestFormat
        extend Paid::Internal::Types::Enum

        JSON_ = "json"
        CSV = "csv"
      end
    end
  end
end
