# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricDetail < Internal::Types::Model
      field :slug, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :category, -> { String }, optional: false, nullable: true

      field :unit, -> { Paid::Types::ValueMetricUnit }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :long_description, -> { String }, optional: false, nullable: true, api_name: "longDescription"

      field :sources, -> { Internal::Types::Array[Paid::Types::ValueMetricDetailSourcesItem] }, optional: false, nullable: true

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :monetary_conversion, -> { Paid::Types::ValueMetricDetailMonetaryConversion }, optional: false, nullable: true, api_name: "monetaryConversion"

      field :formula, -> { Paid::Types::ValueMetricDetailFormula }, optional: false, nullable: true

      field :signals, -> { Internal::Types::Array[Paid::Types::ValueMetricSignalBinding] }, optional: false, nullable: false
    end
  end
end
