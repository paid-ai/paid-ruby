# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # One usage event. Name its customer with `customer`, its customer unit with `customerUnit`, or both: at least one
    # is required, and a batch with a signal that names neither is refused with `400 VALIDATION_ERROR`.
    class Signal < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :customer, -> { Paid::Types::CustomerAttribution }, optional: true, nullable: false

      field :customer_unit, -> { Paid::Types::CustomerUnitAttribution }, optional: true, nullable: false, api_name: "customerUnit"

      field :attribution, -> { Paid::Types::Attribution }, optional: true, nullable: false

      field :timestamp, -> { String }, optional: true, nullable: false

      field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "idempotencyKey"
    end
  end
end
