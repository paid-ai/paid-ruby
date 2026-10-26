# frozen_string_literal: true

module Paid
  module Customers
    module Types
      class RevokeCustomerAPIKeyRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :api_key_id, -> { String }, optional: false, nullable: false, api_name: "apiKeyId"
      end
    end
  end
end
