# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CreateCustomerUnitRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::CustomerUnitCreate }, optional: false, nullable: false
      end
    end
  end
end
