# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class UpdateCustomerByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::UpdateCustomerRequest }, optional: false, nullable: false
      end
    end
  end
end
