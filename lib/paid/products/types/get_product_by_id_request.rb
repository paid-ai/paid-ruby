# frozen_string_literal: true

module Paid
  module Products
    module Types
      class GetProductByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
