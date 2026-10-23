# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentPlanMoneyEffect < Internal::Types::Model
      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"

      field :kind, -> { Paid::Types::AmendmentPlanMoneyEffectKind }, optional: false, nullable: false

      field :order_line_attribute_id, -> { String }, optional: true, nullable: false, api_name: "orderLineAttributeId"

      field :order_line_id, -> { String }, optional: true, nullable: false, api_name: "orderLineId"

      field :amount_minor, -> { Float }, optional: false, nullable: false, api_name: "amountMinor"

      field :currency, -> { String }, optional: false, nullable: false

      field :cycle_start, -> { String }, optional: false, nullable: false, api_name: "cycleStart"

      field :cycle_end, -> { String }, optional: false, nullable: false, api_name: "cycleEnd"

      field :remaining_days, -> { Float }, optional: false, nullable: false, api_name: "remainingDays"

      field :total_days_in_cycle, -> { Float }, optional: false, nullable: false, api_name: "totalDaysInCycle"

      field :billing, -> { Paid::Types::AmendmentMoneyBilling }, optional: false, nullable: false
    end
  end
end
