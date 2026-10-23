# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionOrderLineAttributePricingPricePoints < Internal::Types::Model
      field :currency, -> { String }, optional: true, nullable: false

      field :unit_price, -> { Integer }, optional: false, nullable: false, api_name: "unitPrice"

      field :tiers, -> { Internal::Types::Array[Paid::Types::ProvisionOrderLineAttributePricingPricePointsTiersItem] }, optional: true, nullable: false
    end
  end
end
