# frozen_string_literal: true

module Paid
  module Checkouts
    module Types
      class CreateCheckoutRequest < Internal::Types::Model
        field :products, -> { Internal::Types::Array[Paid::Types::CheckoutProductInput] }, optional: false, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :success_url, -> { String }, optional: false, nullable: false, api_name: "successUrl"

        field :cancel_url, -> { String }, optional: true, nullable: false, api_name: "cancelUrl"

        field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :collect_address, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "collectAddress"

        field :collect_phone, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "collectPhone"

        field :success_title, -> { String }, optional: true, nullable: false, api_name: "successTitle"

        field :success_message, -> { String }, optional: true, nullable: false, api_name: "successMessage"

        field :single_use, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "singleUse"

        field :currency, -> { String }, optional: true, nullable: false

        field :custom_cards, -> { Internal::Types::Array[Paid::Types::CheckoutCustomCardInput] }, optional: true, nullable: false, api_name: "customCards"
      end
    end
  end
end
