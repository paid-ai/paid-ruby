# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueResponse < Internal::Types::Model
      field :currency, -> { String }, optional: false, nullable: false

      field :period, -> { Paid::Types::DeliveredValueResponsePeriod }, optional: false, nullable: false

      field :customer, -> { Paid::Types::DeliveredValueResponseCustomer }, optional: false, nullable: false

      field :value_metrics, -> { Internal::Types::Array[Paid::Types::DeliveredValueMetric] }, optional: false, nullable: false, api_name: "valueMetrics"

      field :signals, -> { Internal::Types::Array[Paid::Types::DeliveredValueSignal] }, optional: false, nullable: false

      field :totals, -> { Paid::Types::DeliveredValueResponseTotals }, optional: false, nullable: false
    end
  end
end
