# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class ListOrderSeatsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :product_external_id, -> { String }, optional: true, nullable: false, api_name: "productExternalId"

        field :status, -> { Paid::Orders::Types::ListOrderSeatsRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
