# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateSeat < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :product, -> { Paid::Types::CustomerStateProductRef }, optional: false, nullable: false

      field :status, -> { Paid::Types::CustomerStateSeatStatus }, optional: false, nullable: false

      field :assignee, -> { Paid::Types::CustomerStateSeatAssignee }, optional: false, nullable: true

      field :credits, -> { Paid::Types::CustomerStateCreditSummary }, optional: false, nullable: false
    end
  end
end
