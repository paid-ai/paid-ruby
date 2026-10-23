# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class UpdateSeatAssignmentRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :seat_id, -> { String }, optional: false, nullable: false, api_name: "seatId"

        field :user_external_id, -> { String }, optional: false, nullable: true, api_name: "userExternalId"
      end
    end
  end
end
