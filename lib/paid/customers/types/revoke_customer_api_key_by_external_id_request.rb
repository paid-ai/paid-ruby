# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class RevokeCustomerAPIKeyByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :api_key_id, -> { String }, optional: false, nullable: false, api_name: "apiKeyId"
      end
    end
  end
end
