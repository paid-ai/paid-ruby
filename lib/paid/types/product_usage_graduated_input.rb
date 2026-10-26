# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductUsageGraduatedInput < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :signal_type, -> { Paid::Types::ProductUsageGraduatedInputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :billing_frequency, -> { Paid::Types::ProductUsageGraduatedInputBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProductUsageGraduatedInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::ProductTieredPricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
