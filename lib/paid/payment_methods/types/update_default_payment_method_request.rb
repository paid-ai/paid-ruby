# frozen_string_literal: true

module Paid
  module PaymentMethods
    module Types
      class UpdateDefaultPaymentMethodRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
