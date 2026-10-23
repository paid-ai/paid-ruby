# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SyncValueReceiptRequest < Internal::Types::Model
      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

      field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"

      field :product, -> { Paid::Types::SyncValueReceiptRequestProduct }, optional: true, nullable: false

      field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
    end
  end
end
