# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class OrderLine < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: true, api_name: "endDate"

      field :line_type, -> { Paid::Types::OrderLineType }, optional: false, nullable: false, api_name: "lineType"
    end
  end
end
