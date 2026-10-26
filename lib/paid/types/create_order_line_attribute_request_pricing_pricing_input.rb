# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreateOrderLineAttributeRequestPricingPricingInput < Internal::Types::Model
      field :kind, -> { Paid::Types::CreateOrderLineAttributeRequestPricingPricingInputKind }, optional: false, nullable: false

      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
