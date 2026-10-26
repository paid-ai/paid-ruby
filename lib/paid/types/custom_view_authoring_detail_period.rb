# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The view's current default date range, or null if it uses no adjustable period.
    class CustomViewAuthoringDetailPeriod < Internal::Types::Model
      field :kind, -> { Paid::Types::CustomViewAuthoringDetailPeriodKind }, optional: false, nullable: false

      field :unit, -> { Paid::Types::CustomViewAuthoringDetailPeriodUnit }, optional: true, nullable: false

      field :amount, -> { Integer }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
    end
  end
end
