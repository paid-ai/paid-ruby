# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Signals
    module Types
      module GetSignalSummaryRequestGroupBy
        extend Paid::Internal::Types::Enum

        SIGNAL_NAME = "signalName"
        DIMENSION = "dimension"
      end
    end
  end
end
