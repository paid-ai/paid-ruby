# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionOrderLineAttribute < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :quantity, -> { Integer }, optional: true, nullable: false

      field :pricing, -> { Paid::Types::ProvisionOrderLineAttributePricing }, optional: true, nullable: false

      field :credit_amount, -> { Float }, optional: true, nullable: true, api_name: "creditAmount"

      field :overage_unit_price, -> { Integer }, optional: true, nullable: true, api_name: "overageUnitPrice"

      field :overage_unit_prices, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: true, api_name: "overageUnitPrices"

      field :discount_type, -> { Paid::Types::ProvisionOrderLineAttributeDiscountType }, optional: true, nullable: false, api_name: "discountType"

      field :discount_percent, -> { Float }, optional: true, nullable: false, api_name: "discountPercent"

      field :discount_amount, -> { Integer }, optional: true, nullable: false, api_name: "discountAmount"
    end
  end
end
