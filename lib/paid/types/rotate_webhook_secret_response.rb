# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class RotateWebhookSecretResponse < Internal::Types::Model
      field :signing_secret, -> { String }, optional: false, nullable: false, api_name: "signingSecret"
    end
  end
end
