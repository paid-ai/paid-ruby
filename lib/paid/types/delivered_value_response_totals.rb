# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueResponseTotals < Internal::Types::Model
      field :monetary_total, -> { Float }, optional: false, nullable: false, api_name: "monetaryTotal"

      field :signal_count, -> { Float }, optional: false, nullable: false, api_name: "signalCount"
    end
  end
end
