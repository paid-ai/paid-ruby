# frozen_string_literal: true

module Paid
  module Products
    module Types
      class CreateProductRequest < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: true, nullable: true

        field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :product_code, -> { String }, optional: true, nullable: true, api_name: "productCode"

        field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true
      end
    end
  end
end
