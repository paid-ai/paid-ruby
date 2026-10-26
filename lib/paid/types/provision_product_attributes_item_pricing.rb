# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionProductAttributesItemPricing < Internal::Types::Model
      field :event_name, -> { String }, optional: true, nullable: false, api_name: "eventName"

      field :charge_type, -> { Paid::Types::ProvisionProductAttributesItemPricingChargeType }, optional: false, nullable: false, api_name: "chargeType"

      field :price_points, -> { Paid::Types::ProvisionProductAttributesItemPricingPricePoints }, optional: false, nullable: false, api_name: "pricePoints"

      field :pricing_model, -> { Paid::Types::ProvisionProductAttributesItemPricingPricingModel }, optional: false, nullable: false, api_name: "pricingModel"

      field :billing_frequency, -> { Paid::Types::ProvisionProductAttributesItemPricingBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProvisionProductAttributesItemPricingBillingType }, optional: true, nullable: false, api_name: "billingType"
    end
  end
end
