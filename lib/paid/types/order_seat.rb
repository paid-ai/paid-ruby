# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class OrderSeat < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :product_external_id, -> { String }, optional: false, nullable: true, api_name: "productExternalId"

      field :status, -> { Paid::Types::SeatAssignmentStatus }, optional: false, nullable: false

      field :assignee, -> { Paid::Types::SeatAssignee }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
