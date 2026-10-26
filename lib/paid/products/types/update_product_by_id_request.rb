# frozen_string_literal: true

module Paid
  module Products
    module Types
      class UpdateProductByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::UpdateProductRequest }, optional: false, nullable: false
      end
    end
  end
end
