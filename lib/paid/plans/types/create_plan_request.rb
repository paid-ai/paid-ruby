# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class CreatePlanRequest < Internal::Types::Model
        field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

        field :name, -> { String }, optional: true, nullable: true

        field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

        field :supported_currencies, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "supportedCurrencies"

        field :is_default, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isDefault"

        field :attributes, -> { Internal::Types::Array[Paid::Types::PlanAttributeInput] }, optional: false, nullable: false
      end
    end
  end
end
