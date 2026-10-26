# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItem < Internal::Types::Model
      field :field, -> { String }, optional: false, nullable: false

      field :operator, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemOperator }, optional: false, nullable: false

      field :value, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemValue }, optional: false, nullable: false

      field :result, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemResult }, optional: false, nullable: false
    end
  end
end
