# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentPlanCreditEffect < Internal::Types::Model
      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"

      field :kind, -> { Paid::Types::AmendmentCreditEffectKind }, optional: false, nullable: false

      field :order_line_attribute_id, -> { String }, optional: true, nullable: false, api_name: "orderLineAttributeId"

      field :at, -> { String }, optional: false, nullable: false

      field :credit_amount, -> { Float }, optional: true, nullable: false, api_name: "creditAmount"

      field :has_infinite_credits, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hasInfiniteCredits"
    end
  end
end
