# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreateOrderLineAttributeRequest < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :quantity, -> { Integer }, optional: true, nullable: false

      field :pricing, -> { Paid::Types::CreateOrderLineAttributeRequestPricing }, optional: false, nullable: false
    end
  end
end
