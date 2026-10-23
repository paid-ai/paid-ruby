# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PrecomputedCost < Internal::Types::Model
      field :timestamp, -> { String }, optional: true, nullable: false

      field :customer, -> { Paid::Types::CustomerAttribution }, optional: false, nullable: false

      field :product, -> { Paid::Types::ProductAttribution }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :vendor, -> { String }, optional: true, nullable: false

      field :model, -> { String }, optional: true, nullable: false
    end
  end
end
