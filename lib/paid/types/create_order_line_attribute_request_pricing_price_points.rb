# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Single flat price point for this order attribute override. Do not send a currency-keyed map here.
    class CreateOrderLineAttributeRequestPricingPricePoints < Internal::Types::Model
      field :currency, -> { String }, optional: true, nullable: false

      field :unit_price, -> { Integer }, optional: false, nullable: false, api_name: "unitPrice"

      field :min_quantity, -> { Integer }, optional: true, nullable: false, api_name: "minQuantity"

      field :included_quantity, -> { Integer }, optional: true, nullable: false, api_name: "includedQuantity"

      field :tiers, -> { Internal::Types::Array[Paid::Types::CreateOrderLineAttributeRequestPricingPricePointsTiersItem] }, optional: true, nullable: false
    end
  end
end
