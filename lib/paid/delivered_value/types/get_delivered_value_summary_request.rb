# frozen_string_literal: true

module Paid
  module DeliveredValue
    module Types
      class GetDeliveredValueSummaryRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"

        field :group_by, -> { Paid::DeliveredValue::Types::GetDeliveredValueSummaryRequestGroupBy }, optional: false, nullable: false, api_name: "groupBy"

        field :dimension_key, -> { String }, optional: true, nullable: false, api_name: "dimensionKey"

        field :value_metric, -> { String }, optional: true, nullable: false, api_name: "valueMetric"

        field :interval, -> { Paid::DeliveredValue::Types::GetDeliveredValueSummaryRequestInterval }, optional: false, nullable: false
      end
    end
  end
end
