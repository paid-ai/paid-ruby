# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItem < Internal::Types::Model
      field :effective_from, -> { String }, optional: false, nullable: false, api_name: "effectiveFrom"

      field :calculation, -> { Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItemCalculation }, optional: false, nullable: false
    end
  end
end
