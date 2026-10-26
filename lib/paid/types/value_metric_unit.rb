# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricUnit < Internal::Types::Model
      field :type, -> { Paid::Types::ValueMetricUnitType }, optional: false, nullable: false

      field :duration_unit, -> { Paid::Types::ValueMetricUnitDurationUnit }, optional: true, nullable: false, api_name: "durationUnit"

      field :unit, -> { String }, optional: true, nullable: false

      field :unit_display, -> { String }, optional: true, nullable: false, api_name: "unitDisplay"
    end
  end
end
