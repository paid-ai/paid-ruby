# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentAttributeOptions < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :state, -> { Paid::Types::AmendmentAttributeState }, optional: false, nullable: false

      field :metered_usage, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "meteredUsage"

      field :intents, -> { Internal::Types::Array[Paid::Types::AmendmentIntentOptions] }, optional: false, nullable: false

      field :locked_reason, -> { String }, optional: true, nullable: false, api_name: "lockedReason"
    end
  end
end
