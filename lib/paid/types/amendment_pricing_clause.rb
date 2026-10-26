# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # One applicability clause. Match every non-empty list. Empty lists constrain nothing.
    class AmendmentPricingClause < Internal::Types::Model
      field :charge_types, -> { Internal::Types::Array[Paid::Types::AmendmentChargeType] }, optional: true, nullable: false, api_name: "chargeTypes"

      field :billing_types, -> { Internal::Types::Array[Paid::Types::AmendmentBillingType] }, optional: true, nullable: false, api_name: "billingTypes"

      field :pricing_models, -> { Internal::Types::Array[Paid::Types::AmendmentPricingModel] }, optional: true, nullable: false, api_name: "pricingModels"
    end
  end
end
