# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GrantCustomerCreditsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::CreditGrantCreateRequest }, optional: false, nullable: false
      end
    end
  end
end
