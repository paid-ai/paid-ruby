# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The view's default date range, or null if it has none.
    class CustomViewSummaryPeriod < Internal::Types::Model
      field :kind, -> { Paid::Types::CustomViewSummaryPeriodKind }, optional: false, nullable: false

      field :unit, -> { Paid::Types::CustomViewSummaryPeriodUnit }, optional: true, nullable: false

      field :amount, -> { Integer }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
    end
  end
end
