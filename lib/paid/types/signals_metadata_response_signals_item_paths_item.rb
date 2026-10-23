# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalsMetadataResponseSignalsItemPathsItem < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false

      field :types, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
