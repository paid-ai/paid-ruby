# frozen_string_literal: true

module Paid
  module Checkouts
    module Types
      class ListCheckoutsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :status, -> { Paid::Checkouts::Types::ListCheckoutsRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
