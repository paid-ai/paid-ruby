# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateCheckoutLink < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::CustomerStateCheckoutLinkStatus }, optional: false, nullable: false

      field :product_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "productIds"

      field :single_use, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "singleUse"

      field :allowed_currencies, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "allowedCurrencies"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"
    end
  end
end
