# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class DeleteCustomerAliasRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"
      end
    end
  end
end
