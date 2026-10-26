# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductRecurringGraduatedInput < Internal::Types::Model
      field :billing_frequency, -> { Paid::Types::ProductRecurringGraduatedInputBillingFrequency }, optional: false, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProductRecurringGraduatedInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::ProductTieredPricePoint] }, optional: false, nullable: false, api_name: "pricePoints"
    end
  end
end
