# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductSeatBasedPerUnitInput < Internal::Types::Model
      field :billing_frequency, -> { Paid::Types::ProductSeatBasedPerUnitInputBillingFrequency }, optional: false, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProductSeatBasedPerUnitInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::ProductSimplePricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
