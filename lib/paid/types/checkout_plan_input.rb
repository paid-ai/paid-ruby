# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CheckoutPlanInput < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :features, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
