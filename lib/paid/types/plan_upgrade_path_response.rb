# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PlanUpgradePathResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::Plan] }, optional: false, nullable: false
    end
  end
end
