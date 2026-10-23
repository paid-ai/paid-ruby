# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      # Optional default date range. Required if any query uses the `{period_start:DateTime}` / `{period_end:DateTime}`
      # placeholders. Can be changed later in Paid without re-authoring.
      class CreateCustomViewRequestPeriod < Internal::Types::Model
        field :kind, -> { Paid::CustomViewsExperimental::Types::CreateCustomViewRequestPeriodKind }, optional: false, nullable: false

        field :unit, -> { Paid::CustomViewsExperimental::Types::CreateCustomViewRequestPeriodUnit }, optional: true, nullable: false

        field :amount, -> { Integer }, optional: true, nullable: false

        field :start, -> { String }, optional: true, nullable: false

        field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
      end
    end
  end
end
