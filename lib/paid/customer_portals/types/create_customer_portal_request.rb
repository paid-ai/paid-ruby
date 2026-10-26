# frozen_string_literal: true

module Paid
  module CustomerPortals
    module Types
      class CreateCustomerPortalRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :return_url, -> { String }, optional: true, nullable: false, api_name: "returnUrl"

        field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
      end
    end
  end
end
