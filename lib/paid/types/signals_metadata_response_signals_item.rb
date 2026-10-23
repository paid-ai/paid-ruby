# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalsMetadataResponseSignalsItem < Internal::Types::Model
      field :signal_name, -> { String }, optional: false, nullable: false, api_name: "signalName"

      field :paths, -> { Internal::Types::Array[Paid::Types::SignalsMetadataResponseSignalsItemPathsItem] }, optional: false, nullable: false
    end
  end
end
