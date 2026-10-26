# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The view's current default date range, or null if it uses no adjustable period.
    class CustomViewDetailPeriod < Internal::Types::Model
      field :kind, -> { Paid::Types::CustomViewDetailPeriodKind }, optional: false, nullable: false

      field :unit, -> { Paid::Types::CustomViewDetailPeriodUnit }, optional: true, nullable: false

      field :amount, -> { Integer }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
    end
  end
end
