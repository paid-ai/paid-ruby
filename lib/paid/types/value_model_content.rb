# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Full value model configuration: value types, formulas, events, overrides, and actions.
    class ValueModelContent < Internal::Types::Model
      field :currency, -> { String }, optional: false, nullable: false

      field :value_types, -> { Internal::Types::Array[Paid::Types::ValueModelContentValueTypesItem] }, optional: false, nullable: false, api_name: "valueTypes"

      field :formulas, -> { Internal::Types::Array[Paid::Types::ValueModelContentFormulasItem] }, optional: false, nullable: false

      field :signals, -> { Internal::Types::Array[Paid::Types::ValueModelContentSignalsItem] }, optional: false, nullable: false

      field :segment_tables, -> { Internal::Types::Array[Paid::Types::ValueModelContentSegmentTablesItem] }, optional: true, nullable: false, api_name: "segmentTables"

      field :overrides, -> { Internal::Types::Array[Paid::Types::ValueModelContentOverridesItem] }, optional: true, nullable: false

      field :grouping_keys, -> { Internal::Types::Array[Paid::Types::ValueModelContentGroupingKeysItem] }, optional: true, nullable: false, api_name: "groupingKeys"

      field :flows, -> { Internal::Types::Array[Paid::Types::ValueModelContentFlowsItem] }, optional: true, nullable: false

      field :actions, -> { Internal::Types::Array[Paid::Types::ValueModelContentActionsItem] }, optional: true, nullable: false
    end
  end
end
