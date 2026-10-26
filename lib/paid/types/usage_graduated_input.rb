# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UsageGraduatedInput < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :signal_type, -> { Paid::Types::UsageGraduatedInputSignalType }, optional: true, nullable: false, api_name: "signalType"

      field :billing_frequency, -> { Paid::Types::UsageGraduatedInputBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::UsageGraduatedInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::TieredPricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
