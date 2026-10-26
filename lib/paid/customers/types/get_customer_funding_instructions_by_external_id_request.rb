# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class GetCustomerFundingInstructionsByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :currency, -> { String }, optional: true, nullable: false
      end
    end
  end
end
