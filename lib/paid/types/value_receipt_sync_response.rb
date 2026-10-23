# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueReceiptSyncResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :public_url_token, -> { String }, optional: false, nullable: false, api_name: "publicUrlToken"

      field :public_url, -> { String }, optional: false, nullable: false, api_name: "publicUrl"

      field :generated_at, -> { String }, optional: true, nullable: true, api_name: "generatedAt"
    end
  end
end
