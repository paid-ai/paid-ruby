# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CreateCustomerFundingInstructionsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::CustomerFundingInstructionsCreateRequest }, optional: false, nullable: false
      end
    end
  end
end
