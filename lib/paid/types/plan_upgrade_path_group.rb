# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PlanUpgradePathGroup < Internal::Types::Model
      field :frequency, -> { String }, optional: false, nullable: true

      field :plan_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "planIds"
    end
  end
end
