# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductOneTimePerUnitInput < Internal::Types::Model
      field :fee_type, -> { Paid::Types::ProductOneTimePerUnitInputFeeType }, optional: true, nullable: false, api_name: "feeType"

      field :billing_type, -> { Paid::Types::ProductOneTimePerUnitInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::ProductSimplePricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
