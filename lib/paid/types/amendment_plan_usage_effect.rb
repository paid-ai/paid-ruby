# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentPlanUsageEffect < Internal::Types::Model
      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"

      field :kind, -> { Paid::Types::AmendmentPlanUsageEffectKind }, optional: false, nullable: false

      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"
    end
  end
end
