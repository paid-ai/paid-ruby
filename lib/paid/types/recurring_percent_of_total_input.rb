# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class RecurringPercentOfTotalInput < Internal::Types::Model
      field :percentage_value, -> { Float }, optional: false, nullable: false, api_name: "percentageValue"

      field :billing_frequency, -> { Paid::Types::RecurringPercentOfTotalInputBillingFrequency }, optional: false, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::RecurringPercentOfTotalInputBillingType }, optional: true, nullable: false, api_name: "billingType"

      field :price_points, -> { Internal::Types::Array[Paid::Types::SimplePricePoint] }, optional: true, nullable: false, api_name: "pricePoints"
    end
  end
end
