# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The order-level end-date write of an `updateOrderTerm` intent.
    class PlannedOrderTerm < Internal::Types::Model
      field :new_end_date, -> { String }, optional: false, nullable: false, api_name: "newEndDate"

      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"
    end
  end
end
