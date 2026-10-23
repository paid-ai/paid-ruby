# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PricingTierOutput < Internal::Types::Model
      field :flat_amount, -> { Float }, optional: true, nullable: false, api_name: "flatAmount"

      field :index, -> { Float }, optional: true, nullable: false

      field :lower_bound, -> { Float }, optional: false, nullable: false, api_name: "lowerBound"

      field :number, -> { Float }, optional: true, nullable: false

      field :tier_billing_type, -> { Paid::Types::PricingTierOutputTierBillingType }, optional: true, nullable: false, api_name: "tierBillingType"

      field :unit_amount, -> { Float }, optional: true, nullable: false, api_name: "unitAmount"

      field :upper_bound, -> { Float }, optional: true, nullable: false, api_name: "upperBound"
    end
  end
end
