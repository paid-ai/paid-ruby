# frozen_string_literal: true

module Paid
  module Products
    module Types
      class UpdateProductByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :body, -> { Paid::Types::UpdateProductRequest }, optional: false, nullable: false
      end
    end
  end
end
