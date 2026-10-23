# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionProduct < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :product_code, -> { String }, optional: true, nullable: false, api_name: "productCode"

      field :description, -> { String }, optional: true, nullable: false

      field :attributes, -> { Internal::Types::Array[Paid::Types::ProvisionProductAttributesItem] }, optional: true, nullable: false
    end
  end
end
