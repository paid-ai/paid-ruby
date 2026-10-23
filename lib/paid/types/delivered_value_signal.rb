# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueSignal < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :label, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :value_type_slugs, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "valueTypeSlugs"

      field :tags, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :count, -> { Float }, optional: false, nullable: false

      field :values, -> { Internal::Types::Array[Paid::Types::DeliveredValueSignalValue] }, optional: false, nullable: false
    end
  end
end
