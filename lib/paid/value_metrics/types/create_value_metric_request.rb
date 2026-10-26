# frozen_string_literal: true

module Paid
  module ValueMetrics
    module Types
      class CreateValueMetricRequest < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :slug, -> { String }, optional: true, nullable: false

        field :unit, -> { Paid::Types::ValueMetricUnit }, optional: false, nullable: false

        field :monetary_conversion, -> { Paid::Types::ValueMetricMonetaryConversion }, optional: true, nullable: true, api_name: "monetaryConversion"

        field :formula, -> { Paid::Types::ValueMetricFormula }, optional: false, nullable: false

        field :signal, -> { Paid::Types::ValueMetricSignalBinding }, optional: false, nullable: false

        field :category, -> { Paid::ValueMetrics::Types::CreateValueMetricRequestCategory }, optional: true, nullable: true

        field :description, -> { String }, optional: true, nullable: true

        field :long_description, -> { String }, optional: true, nullable: true, api_name: "longDescription"

        field :sources, -> { Internal::Types::Array[Paid::ValueMetrics::Types::CreateValueMetricRequestSourcesItem] }, optional: true, nullable: true

        field :expected_active_version, -> { Integer }, optional: true, nullable: false, api_name: "expectedActiveVersion"
      end
    end
  end
end
