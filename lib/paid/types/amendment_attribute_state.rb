# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentAttributeState < Internal::Types::Model
      field :quantity, -> { Float }, optional: false, nullable: false

      field :unit_price_minor, -> { Float }, optional: true, nullable: false, api_name: "unitPriceMinor"

      field :total_amount_minor, -> { Float }, optional: true, nullable: false, api_name: "totalAmountMinor"

      field :credit_cost, -> { Float }, optional: true, nullable: false, api_name: "creditCost"

      field :credit_benefit_amount, -> { Float }, optional: true, nullable: false, api_name: "creditBenefitAmount"

      field :has_infinite_credit_benefits, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hasInfiniteCreditBenefits"

      field :currency, -> { String }, optional: true, nullable: false

      field :charge_type, -> { Paid::Types::AmendmentChargeType }, optional: true, nullable: false, api_name: "chargeType"

      field :metered_usage, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "meteredUsage"

      field :product_id, -> { String }, optional: true, nullable: false, api_name: "productId"
    end
  end
end
