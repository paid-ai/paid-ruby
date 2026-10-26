# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueMetric < Internal::Types::Model
      field :slug, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :category, -> { String }, optional: false, nullable: true

      field :unit, -> { Paid::Types::ValueMetricUnit }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :long_description, -> { String }, optional: false, nullable: true, api_name: "longDescription"

      field :sources, -> { Internal::Types::Array[Paid::Types::DeliveredValueMetricSourcesItem] }, optional: false, nullable: true

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :monetary_conversion, -> { Paid::Types::DeliveredValueMetricMonetaryConversion }, optional: false, nullable: true, api_name: "monetaryConversion"

      field :formula, -> { Paid::Types::DeliveredValueMetricFormula }, optional: false, nullable: true

      field :calculations, -> { Internal::Types::Array[Paid::Types::DeliveredValueCalculation] }, optional: true, nullable: false

      field :unit_total, -> { Float }, optional: true, nullable: false, api_name: "unitTotal"

      field :monetary_total, -> { Float }, optional: false, nullable: true, api_name: "monetaryTotal"

      field :signal_count, -> { Float }, optional: false, nullable: false, api_name: "signalCount"
    end
  end
end
