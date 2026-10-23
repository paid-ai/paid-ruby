# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Checkout < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::CheckoutStatus }, optional: false, nullable: false

      field :products, -> { Internal::Types::Array[Paid::Types::CheckoutProduct] }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: true, api_name: "customerId"

      field :external_customer_id, -> { String }, optional: false, nullable: true, api_name: "externalCustomerId"

      field :success_url, -> { String }, optional: false, nullable: false, api_name: "successUrl"

      field :cancel_url, -> { String }, optional: false, nullable: true, api_name: "cancelUrl"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :collect_address, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "collectAddress"

      field :collect_phone, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "collectPhone"

      field :single_use, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "singleUse"

      field :allowed_currencies, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "allowedCurrencies"

      field :custom_cards, -> { Internal::Types::Array[Paid::Types::CheckoutCustomCard] }, optional: true, nullable: false, api_name: "customCards"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
