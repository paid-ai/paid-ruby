# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerFundingInstructionsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: true, nullable: false
      end
    end
  end
end
