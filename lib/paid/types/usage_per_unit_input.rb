# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UsagePerUnitInput < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :signal_type, -> { Paid::Types::UsagePerUnitInputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :billing_frequency, -> { Paid::Types::UsagePerUnitInputBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::UsagePerUnitInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::SimplePricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
