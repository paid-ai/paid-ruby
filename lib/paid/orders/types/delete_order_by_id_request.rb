# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class DeleteOrderByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
