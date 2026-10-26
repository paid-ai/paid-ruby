# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentPlan < Internal::Types::Model
      field :plan_version, -> { Float }, optional: false, nullable: false, api_name: "planVersion"

      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :order_version, -> { Float }, optional: false, nullable: false, api_name: "orderVersion"

      field :effective_date, -> { String }, optional: false, nullable: false, api_name: "effectiveDate"

      field :operations, -> { Paid::Types::PlannedOperations }, optional: false, nullable: false

      field :money_effects, -> { Internal::Types::Array[Paid::Types::AmendmentPlanMoneyEffect] }, optional: false, nullable: true, api_name: "moneyEffects"

      field :credit_effects, -> { Internal::Types::Array[Paid::Types::AmendmentPlanCreditEffect] }, optional: false, nullable: true, api_name: "creditEffects"

      field :usage_effects, -> { Internal::Types::Array[Paid::Types::AmendmentPlanUsageEffect] }, optional: true, nullable: true, api_name: "usageEffects"

      field :treatments_resolved, -> { Internal::Types::Array[Paid::Types::AmendmentPlanTreatmentResolution] }, optional: false, nullable: true, api_name: "treatmentsResolved"

      field :state_diff, -> { Internal::Types::Array[Paid::Types::AmendmentPlanAttributeDiff] }, optional: false, nullable: true, api_name: "stateDiff"

      field :plan_hash, -> { String }, optional: false, nullable: false, api_name: "planHash"
    end
  end
end
