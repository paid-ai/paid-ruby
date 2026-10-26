# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class WebhookListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::Webhook] }, optional: false, nullable: false

      field :signing_secret_configured, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "signingSecretConfigured"
    end
  end
end
