# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitType < Internal::Types::Model
      field :type, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitTypeType }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :unit_display, -> { String }, optional: false, nullable: false
    end
  end
end
