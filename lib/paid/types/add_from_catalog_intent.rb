# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Add a catalog attribute to the order. This is the supported add path.
    class AddFromCatalogIntent < Internal::Types::Model
      field :product_attribute_id, -> { String }, optional: false, nullable: false, api_name: "productAttributeId"

      field :quantity, -> { Integer }, optional: true, nullable: false

      field :unit_price_minor, -> { Integer }, optional: true, nullable: false, api_name: "unitPriceMinor"

      field :charge_stub, -> { Paid::Types::AddFromCatalogIntentChargeStub }, optional: true, nullable: false, api_name: "chargeStub"
    end
  end
end
