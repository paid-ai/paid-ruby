# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class ActivateOrderByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
