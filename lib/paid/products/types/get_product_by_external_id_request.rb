# frozen_string_literal: true

module Paid
  module Products
    module Types
      class GetProductByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"
      end
    end
  end
end
