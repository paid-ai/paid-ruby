# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Webhook < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { Paid::Types::WebhookName }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: true

      field :last_sent_at, -> { String }, optional: false, nullable: true, api_name: "lastSentAt"

      field :last_status, -> { Paid::Types::WebhookDeliveryStatus }, optional: false, nullable: true, api_name: "lastStatus"
    end
  end
end
