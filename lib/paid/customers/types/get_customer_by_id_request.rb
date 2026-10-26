# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
