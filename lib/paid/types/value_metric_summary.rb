# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricSummary < Internal::Types::Model
      field :slug, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :category, -> { String }, optional: false, nullable: true

      field :unit, -> { Paid::Types::ValueMetricUnit }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :monetary_conversion, -> { Paid::Types::ValueMetricSummaryMonetaryConversion }, optional: false, nullable: true, api_name: "monetaryConversion"
    end
  end
end
