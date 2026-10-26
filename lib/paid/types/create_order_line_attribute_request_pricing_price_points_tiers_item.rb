# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreateOrderLineAttributeRequestPricingPricePointsTiersItem < Internal::Types::Model
      field :flat_amount, -> { Integer }, optional: true, nullable: false, api_name: "flatAmount"

      field :index, -> { Float }, optional: true, nullable: false

      field :lower_bound, -> { Integer }, optional: true, nullable: false, api_name: "lowerBound"

      field :number, -> { Integer }, optional: true, nullable: false

      field :tier_billing_type, -> { Paid::Types::CreateOrderLineAttributeRequestPricingPricePointsTiersItemTierBillingType }, optional: true, nullable: false, api_name: "tierBillingType"

      field :unit_amount, -> { Integer }, optional: true, nullable: false, api_name: "unitAmount"

      field :upper_bound, -> { Integer }, optional: true, nullable: false, api_name: "upperBound"
    end
  end
end
