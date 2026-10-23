# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerStateByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
