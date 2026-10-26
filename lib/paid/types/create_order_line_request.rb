# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # When override `attributes` are omitted, the order will match the base product (or default plan if plans are
    # configured).
    class CreateOrderLineRequest < Internal::Types::Model
      field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :start_date, -> { String }, optional: true, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

      field :attributes, -> { Internal::Types::Array[Paid::Types::CreateOrderLineAttributeRequest] }, optional: true, nullable: false

      field :line_type, -> { Paid::Types::WritableOrderLineType }, optional: true, nullable: false, api_name: "lineType"
    end
  end
end
