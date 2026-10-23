# frozen_string_literal: true

module Paid
  module Webhooks
    module Types
      class UpdateWebhookRequest < Internal::Types::Model
        field :webhook_name, -> { Paid::Webhooks::Types::UpdateWebhookRequestWebhookName }, optional: false, nullable: false, api_name: "webhookName"

        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :url, -> { String }, optional: true, nullable: true
      end
    end
  end
end
