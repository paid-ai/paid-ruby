# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PricingPricePointOutput < Internal::Types::Model
      field :currency, -> { String }, optional: false, nullable: false

      field :unit_price, -> { Float }, optional: false, nullable: false, api_name: "unitPrice"

      field :tiers, -> { Internal::Types::Array[Paid::Types::PricingTierOutput] }, optional: true, nullable: false

      field :min_quantity, -> { Float }, optional: true, nullable: false, api_name: "minQuantity"

      field :max_quantity, -> { Float }, optional: true, nullable: false, api_name: "maxQuantity"

      field :included_quantity, -> { Float }, optional: true, nullable: false, api_name: "includedQuantity"
    end
  end
end
