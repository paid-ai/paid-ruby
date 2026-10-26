# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SeatAssignee < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :email, -> { String }, optional: false, nullable: true
    end
  end
end
