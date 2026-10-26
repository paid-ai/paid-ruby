# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The product and plan the customer selected, once checkout completes. Null before completion.
    class CheckoutSelectedProduct < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :plan, -> { Paid::Types::PlanRef }, optional: false, nullable: true
    end
  end
end
