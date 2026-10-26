# frozen_string_literal: true

module Paid
  module Signals
    module Types
      class BulkSignalsRequest < Internal::Types::Model
        field :signals, -> { Internal::Types::Array[Paid::Types::Signal] }, optional: false, nullable: false
      end
    end
  end
end
