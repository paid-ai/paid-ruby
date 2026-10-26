# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversion < Internal::Types::Model
      field :expression, -> { String }, optional: false, nullable: false

      field :variables, -> { Internal::Types::Array[Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionVariablesItem] }, optional: true, nullable: false

      field :conditions, -> { Internal::Types::Array[Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItem] }, optional: true, nullable: false
    end
  end
end
