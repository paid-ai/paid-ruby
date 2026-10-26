# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueReceiptSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :public_url_token, -> { String }, optional: false, nullable: false, api_name: "publicUrlToken"

      field :public_url, -> { String }, optional: false, nullable: false, api_name: "publicUrl"

      field :is_published, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isPublished"

      field :customer_id, -> { String }, optional: false, nullable: true, api_name: "customerId"

      field :customer_name, -> { String }, optional: false, nullable: true, api_name: "customerName"

      field :customer_external_id, -> { String }, optional: false, nullable: true, api_name: "customerExternalId"

      field :order_id, -> { String }, optional: false, nullable: true, api_name: "orderId"

      field :product_id, -> { String }, optional: false, nullable: true, api_name: "productId"

      field :currency, -> { String }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: true, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: true, api_name: "endDate"

      field :total_delivered_value, -> { Float }, optional: false, nullable: true, api_name: "totalDeliveredValue"

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
