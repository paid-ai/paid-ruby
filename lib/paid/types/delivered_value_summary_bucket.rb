# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueSummaryBucket < Internal::Types::Model
      field :period_start, -> { String }, optional: false, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: false, api_name: "periodEnd"

      field :group_key, -> { String }, optional: false, nullable: false, api_name: "groupKey"

      field :value_metric, -> { String }, optional: true, nullable: false, api_name: "valueMetric"

      field :condition_index, -> { Float }, optional: true, nullable: false, api_name: "conditionIndex"

      field :condition_label, -> { String }, optional: true, nullable: false, api_name: "conditionLabel"

      field :unit_total, -> { Float }, optional: true, nullable: false, api_name: "unitTotal"

      field :monetary_total, -> { Float }, optional: false, nullable: false, api_name: "monetaryTotal"

      field :signal_count, -> { Float }, optional: false, nullable: false, api_name: "signalCount"
    end
  end
end
