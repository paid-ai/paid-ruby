# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PaymentAllocationCreateResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::PaymentAllocation] }, optional: false, nullable: false
    end
  end
end
