# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CheckoutProduct < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :plans, -> { Internal::Types::Array[Paid::Types::CheckoutPlan] }, optional: true, nullable: false
    end
  end
end
