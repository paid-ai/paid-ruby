# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UsageCost < Internal::Types::Model
      field :timestamp, -> { String }, optional: true, nullable: false

      field :customer, -> { Paid::Types::CustomerAttribution }, optional: false, nullable: false

      field :product, -> { Paid::Types::ProductAttribution }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :vendor, -> { String }, optional: false, nullable: false

      field :model, -> { String }, optional: false, nullable: false

      field :usage, -> { Paid::Types::TokenUsage }, optional: false, nullable: false

      field :cost_override, -> { Paid::Types::CostOverride }, optional: true, nullable: false, api_name: "costOverride"
    end
  end
end
