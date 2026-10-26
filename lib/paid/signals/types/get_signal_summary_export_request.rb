# frozen_string_literal: true

module Paid
  module Signals
    module Types
      class GetSignalSummaryExportRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
