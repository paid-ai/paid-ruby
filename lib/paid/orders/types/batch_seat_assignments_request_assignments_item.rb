# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module Orders
    module Types
      class BatchSeatAssignmentsRequestAssignmentsItem < Internal::Types::Model
        field :seat_id, -> { String }, optional: false, nullable: false, api_name: "seatId"

        field :user_external_id, -> { String }, optional: false, nullable: true, api_name: "userExternalId"
      end
    end
  end
end
