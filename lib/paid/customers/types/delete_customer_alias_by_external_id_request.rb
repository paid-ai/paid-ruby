# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class DeleteCustomerAliasByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"
      end
    end
  end
end
