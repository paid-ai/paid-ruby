# frozen_string_literal: true

module Paid
  module Webhooks
    module Types
      class TestWebhookRequest < Internal::Types::Model
        field :webhook_name, -> { Paid::Webhooks::Types::TestWebhookRequestWebhookName }, optional: false, nullable: false, api_name: "webhookName"
      end
    end
  end
end
