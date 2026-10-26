# frozen_string_literal: true

module Paid
  module Products
    module Types
      class ListProductsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :archived, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
