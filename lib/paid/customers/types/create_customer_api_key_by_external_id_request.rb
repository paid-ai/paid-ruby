# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class CreateCustomerAPIKeyByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :body, -> { Paid::Types::CustomerAPIKeyCreate }, optional: false, nullable: false
      end
    end
  end
end
