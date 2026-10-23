# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueSummaryResponse < Internal::Types::Model
      field :currency, -> { String }, optional: false, nullable: false

      field :customer, -> { Paid::Types::DeliveredValueSummaryResponseCustomer }, optional: false, nullable: false

      field :group_by, -> { Paid::Types::DeliveredValueSummaryResponseGroupBy }, optional: false, nullable: false, api_name: "groupBy"

      field :dimension_key, -> { String }, optional: true, nullable: false, api_name: "dimensionKey"

      field :value_metric, -> { String }, optional: true, nullable: false, api_name: "valueMetric"

      field :interval, -> { Paid::Types::DeliveredValueSummaryResponseInterval }, optional: false, nullable: false

      field :data, -> { Internal::Types::Array[Paid::Types::DeliveredValueSummaryBucket] }, optional: false, nullable: false
    end
  end
end
