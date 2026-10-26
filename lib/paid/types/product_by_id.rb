# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductByID < Internal::Types::Model
      field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"
    end
  end
end
