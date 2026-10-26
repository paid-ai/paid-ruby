# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalsMetadataResponseSignalsItemPathsItem < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false

      field :types, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :declared, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :slot, -> { Paid::Types::SignalsMetadataResponseSignalsItemPathsItemSlot }, optional: true, nullable: false

      field :first_seen, -> { String }, optional: true, nullable: false, api_name: "firstSeen"

      field :last_seen, -> { String }, optional: true, nullable: false, api_name: "lastSeen"

      field :signals, -> { Integer }, optional: true, nullable: false
    end
  end
end
