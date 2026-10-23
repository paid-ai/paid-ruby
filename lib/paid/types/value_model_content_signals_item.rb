# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentSignalsItem < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :label, -> { String }, optional: false, nullable: false

      field :formula_id, -> { String }, optional: true, nullable: false, api_name: "formulaId"

      field :variable_mapping, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "variableMapping"

      field :defaults, -> { Internal::Types::Hash[String, Paid::Types::ValueModelContentSignalsItemDefaultsValue] }, optional: true, nullable: false

      field :segment_table_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "segmentTableIds"

      field :description, -> { String }, optional: true, nullable: false

      field :labels, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
