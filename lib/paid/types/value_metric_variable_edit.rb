# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricVariableEdit < Internal::Types::Model
      field :value, -> { Float }, optional: true, nullable: false

      field :label, -> { String }, optional: true, nullable: false

      field :format, -> { Paid::Types::ValueMetricVariableEditFormat }, optional: true, nullable: true

      field :format_unit, -> { Paid::Types::ValueMetricVariableEditFormatUnit }, optional: true, nullable: true, api_name: "formatUnit"
    end
  end
end
