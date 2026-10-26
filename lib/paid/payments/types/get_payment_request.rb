# frozen_string_literal: true

module Paid
  module Payments
    module Types
      class GetPaymentRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
