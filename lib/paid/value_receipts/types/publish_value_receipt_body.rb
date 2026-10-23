# frozen_string_literal: true

module Paid
  module ValueReceipts
    module Types
      class PublishValueReceiptBody < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :publish_expires_at, -> { String }, optional: true, nullable: true, api_name: "publishExpiresAt"
      end
    end
  end
end
