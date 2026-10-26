# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnit < Internal::Types::Model
      field :type, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnitType }, optional: false, nullable: false

      field :duration_unit, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnitDurationUnit }, optional: false, nullable: false, api_name: "durationUnit"
    end
  end
end
