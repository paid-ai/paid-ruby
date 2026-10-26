# frozen_string_literal: true

module Paid
  module ValueMetrics
    module Types
      class UpdateValueMetricRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :unit, -> { Paid::Types::ValueMetricUnit }, optional: true, nullable: false

        field :monetary_conversion, -> { Paid::Types::ValueMetricMonetaryConversion }, optional: true, nullable: true, api_name: "monetaryConversion"

        field :variables, -> { Internal::Types::Hash[String, Paid::Types::ValueMetricVariableEdit] }, optional: true, nullable: false

        field :archived_at, -> { String }, optional: true, nullable: true, api_name: "archivedAt"

        field :category, -> { Paid::ValueMetrics::Types::UpdateValueMetricRequestCategory }, optional: true, nullable: true

        field :description, -> { String }, optional: true, nullable: true

        field :long_description, -> { String }, optional: true, nullable: true, api_name: "longDescription"

        field :sources, -> { Internal::Types::Array[Paid::ValueMetrics::Types::UpdateValueMetricRequestSourcesItem] }, optional: true, nullable: true

        field :expected_active_version, -> { Integer }, optional: true, nullable: false, api_name: "expectedActiveVersion"
      end
    end
  end
end
