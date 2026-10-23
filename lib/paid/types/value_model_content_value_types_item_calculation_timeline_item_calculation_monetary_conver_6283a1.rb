# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionVariablesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :default, -> { Float }, optional: false, nullable: false
    end
  end
end
