# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricFormula < Internal::Types::Model
      field :label, -> { String }, optional: true, nullable: false

      field :expression, -> { String }, optional: false, nullable: false

      field :variables, -> { Internal::Types::Array[Paid::Types::ValueMetricFormulaVariable] }, optional: false, nullable: false
    end
  end
end
