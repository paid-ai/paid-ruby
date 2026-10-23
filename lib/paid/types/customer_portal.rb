# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerPortal < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :url, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::CustomerPortalStatus }, optional: false, nullable: false

      field :return_url, -> { String }, optional: false, nullable: true, api_name: "returnUrl"

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
