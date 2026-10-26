# frozen_string_literal: true

module Paid
  module PaymentAllocations
    module Types
      class CreatePaymentAllocationRequest < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"

        field :allocations, -> { Internal::Types::Array[Paid::Types::PaymentAllocationInput] }, optional: false, nullable: false
      end
    end
  end
end
