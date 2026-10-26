# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdateProductRequest < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: true

      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :product_code, -> { String }, optional: true, nullable: true, api_name: "productCode"

      field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :product_attributes, -> { Internal::Types::Array[Paid::Types::ProductAttributeUpsert] }, optional: true, nullable: false, api_name: "productAttributes"
    end
  end
end
