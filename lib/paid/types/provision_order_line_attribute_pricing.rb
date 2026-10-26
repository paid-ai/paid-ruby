# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # When omitted, the line uses the pricing of the product attribute with the same name, unchanged. This includes
    # pricing models that this request cannot express. Send pricing only to override the catalog price for this order.
    class ProvisionOrderLineAttributePricing < Internal::Types::Model
      field :event_name, -> { String }, optional: true, nullable: false, api_name: "eventName"

      field :charge_type, -> { Paid::Types::ProvisionOrderLineAttributePricingChargeType }, optional: false, nullable: false, api_name: "chargeType"

      field :price_points, -> { Paid::Types::ProvisionOrderLineAttributePricingPricePoints }, optional: false, nullable: false, api_name: "pricePoints"

      field :pricing_model, -> { Paid::Types::ProvisionOrderLineAttributePricingPricingModel }, optional: false, nullable: false, api_name: "pricingModel"

      field :billing_frequency, -> { Paid::Types::ProvisionOrderLineAttributePricingBillingFrequency }, optional: true, nullable: false, api_name: "billingFrequency"

      field :billing_frequency_custom_months, -> { Integer }, optional: true, nullable: false, api_name: "billingFrequencyCustomMonths"

      field :billing_type, -> { Paid::Types::ProvisionOrderLineAttributePricingBillingType }, optional: true, nullable: false, api_name: "billingType"
    end
  end
end
