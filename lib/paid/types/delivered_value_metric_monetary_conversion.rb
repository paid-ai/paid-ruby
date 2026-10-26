# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueMetricMonetaryConversion < Internal::Types::Model
      field :value_per_unit, -> { Float }, optional: false, nullable: true, api_name: "valuePerUnit"

      field :label, -> { String }, optional: false, nullable: true

      field :expression, -> { String }, optional: false, nullable: false

      field :variables, -> { Internal::Types::Array[Paid::Types::DeliveredValueMetricMonetaryConversionVariablesItem] }, optional: false, nullable: false
    end
  end
end
