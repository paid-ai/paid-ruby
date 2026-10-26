# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentLineOptions < Internal::Types::Model
      field :order_line_id, -> { String }, optional: false, nullable: false, api_name: "orderLineId"

      field :attributes, -> { Internal::Types::Array[Paid::Types::AmendmentAttributeOptions] }, optional: false, nullable: false

      field :intents, -> { Internal::Types::Array[Paid::Types::AmendmentIntentOptions] }, optional: true, nullable: false

      field :locked_reason, -> { String }, optional: true, nullable: false, api_name: "lockedReason"
    end
  end
end
