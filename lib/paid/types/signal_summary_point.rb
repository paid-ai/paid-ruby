# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryPoint < Internal::Types::Model
      field :period_start, -> { String }, optional: false, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: false, api_name: "periodEnd"

      field :group_key, -> { String }, optional: true, nullable: false, api_name: "groupKey"

      field :signal_count, -> { Float }, optional: false, nullable: false, api_name: "signalCount"

      field :quantity_total, -> { Float }, optional: false, nullable: false, api_name: "quantityTotal"
    end
  end
end
