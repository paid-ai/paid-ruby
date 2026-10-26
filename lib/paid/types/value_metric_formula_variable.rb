# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricFormulaVariable < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :type, -> { Paid::Types::ValueMetricFormulaVariableType }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :format, -> { Paid::Types::ValueMetricFormulaVariableFormat }, optional: true, nullable: false

      field :format_unit, -> { Paid::Types::ValueMetricFormulaVariableFormatUnit }, optional: true, nullable: false, api_name: "formatUnit"
    end
  end
end
