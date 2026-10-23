# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SimplePricePoint < Internal::Types::Model
      field :currency, -> { String }, optional: false, nullable: false

      field :unit_price, -> { Integer }, optional: false, nullable: false, api_name: "unitPrice"

      field :tiers, -> { Internal::Types::Array[Paid::Types::SimplePricePointTiersItem] }, optional: true, nullable: false

      field :min_quantity, -> { Integer }, optional: true, nullable: false, api_name: "minQuantity"

      field :max_quantity, -> { Integer }, optional: true, nullable: false, api_name: "maxQuantity"

      field :included_quantity, -> { Integer }, optional: true, nullable: false, api_name: "includedQuantity"
    end
  end
end
