# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricMonetaryConversion < Internal::Types::Model
      field :value_per_unit, -> { Float }, optional: false, nullable: false, api_name: "valuePerUnit"

      field :label, -> { String }, optional: true, nullable: false
    end
  end
end
