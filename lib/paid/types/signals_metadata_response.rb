# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalsMetadataResponse < Internal::Types::Model
      field :signals, -> { Internal::Types::Array[Paid::Types::SignalsMetadataResponseSignalsItem] }, optional: false, nullable: false

      field :meta, -> { Paid::Types::SignalsMetadataResponseMeta }, optional: false, nullable: false
    end
  end
end
