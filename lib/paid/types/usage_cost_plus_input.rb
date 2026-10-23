# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UsageCostPlusInput < Internal::Types::Model
      field :cost_plus_multiplier, -> { Float }, optional: false, nullable: false, api_name: "costPlusMultiplier"

      field :signal_type, -> { Paid::Types::UsageCostPlusInputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :billing_frequency, -> { Paid::Types::UsageCostPlusInputBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::UsageCostPlusInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::SimplePricePoint] }, optional: true, nullable: false, api_name: "pricePoints"
    end
  end
end
