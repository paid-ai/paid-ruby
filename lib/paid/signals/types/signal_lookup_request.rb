# frozen_string_literal: true

module Paid
  module Signals
    module Types
      class SignalLookupRequest < Internal::Types::Model
        field :ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
