# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricDetailFormula < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :expression, -> { String }, optional: false, nullable: false

      field :variables, -> { Internal::Types::Array[Paid::Types::ValueMetricFormulaVariable] }, optional: false, nullable: false
    end
  end
end
