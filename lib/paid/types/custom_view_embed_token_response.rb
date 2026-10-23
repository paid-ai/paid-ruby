# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewEmbedTokenResponse < Internal::Types::Model
      field :token, -> { String }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"
    end
  end
end
