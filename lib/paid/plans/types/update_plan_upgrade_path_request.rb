# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class UpdatePlanUpgradePathRequest < Internal::Types::Model
        field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

        field :groups, -> { Internal::Types::Array[Paid::Types::PlanUpgradePathGroup] }, optional: false, nullable: false
      end
    end
  end
end
