# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionProductAttributesItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :sequence, -> { Integer }, optional: true, nullable: false

      field :time_estimate_minutes, -> { Integer }, optional: true, nullable: false, api_name: "timeEstimateMinutes"

      field :pricing, -> { Paid::Types::ProvisionProductAttributesItemPricing }, optional: false, nullable: false

      field :credit_benefits, -> { Internal::Types::Array[Paid::Types::ProvisionCreditBenefit] }, optional: true, nullable: false, api_name: "creditBenefits"
    end
  end
end
