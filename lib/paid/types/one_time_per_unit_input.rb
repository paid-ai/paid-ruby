# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class OneTimePerUnitInput < Internal::Types::Model
      field :fee_type, -> { Paid::Types::OneTimePerUnitInputFeeType }, optional: true, nullable: false, api_name: "feeType"

      field :billing_type, -> { Paid::Types::OneTimePerUnitInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::SimplePricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
