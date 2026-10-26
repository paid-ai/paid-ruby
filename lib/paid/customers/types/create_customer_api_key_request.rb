# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CreateCustomerAPIKeyRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::CustomerAPIKeyCreate }, optional: false, nullable: false
      end
    end
  end
end
