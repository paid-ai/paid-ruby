# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class ListPlansRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :product_id, -> { String }, optional: true, nullable: false, api_name: "productId"

        field :external_product_id, -> { String }, optional: true, nullable: false, api_name: "externalProductId"

        field :include_archived, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeArchived"
      end
    end
  end
end
