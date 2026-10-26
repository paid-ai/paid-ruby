# frozen_string_literal: true

module Paid
  module DeliveredValue
    module Types
      class GetDeliveredValueRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"
      end
    end
  end
end
