# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculation < Internal::Types::Model
      field :unit, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnit }, optional: false, nullable: false

      field :monetary_conversion, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversion }, optional: true, nullable: false, api_name: "monetaryConversion"

      field :formula_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "formulaIds"

      field :signal_event_names, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "signalEventNames"

      field :segment_table_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "segmentTableIds"

      field :override_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "overrideIds"
    end
  end
end
