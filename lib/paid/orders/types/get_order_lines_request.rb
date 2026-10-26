# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class GetOrderLinesRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
