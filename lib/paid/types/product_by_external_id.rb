# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductByExternalID < Internal::Types::Model
      field :external_product_id, -> { String }, optional: false, nullable: false, api_name: "externalProductId"
    end
  end
end
