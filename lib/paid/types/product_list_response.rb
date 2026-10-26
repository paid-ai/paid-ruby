# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::Product] }, optional: false, nullable: false

      field :pagination, -> { Paid::Types::Pagination }, optional: false, nullable: false
    end
  end
end
