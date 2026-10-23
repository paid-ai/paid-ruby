# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class GetCustomViewEmbedTokenRequest < Internal::Types::Model
        field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

        field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

        field :ttl_seconds, -> { Integer }, optional: true, nullable: false, api_name: "ttlSeconds"
      end
    end
  end
end
