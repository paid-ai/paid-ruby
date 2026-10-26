# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalListItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: true, api_name: "customerId"

      field :external_customer_id, -> { String }, optional: false, nullable: true, api_name: "externalCustomerId"

      field :product_id, -> { String }, optional: false, nullable: true, api_name: "productId"

      field :external_product_id, -> { String }, optional: false, nullable: true, api_name: "externalProductId"

      field :trace_id, -> { String }, optional: false, nullable: true, api_name: "traceId"

      field :data, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
