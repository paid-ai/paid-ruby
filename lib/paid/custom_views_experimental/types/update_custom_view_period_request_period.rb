# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      # Default date range for the view's queries. Use `{period_start:DateTime}` / `{period_end:DateTime}` placeholders
      # in your SQL to make the range adjustable. Either relative (unit+amount) or absolute (start+end).
      class UpdateCustomViewPeriodRequestPeriod < Internal::Types::Model
        field :kind, -> { Paid::CustomViewsExperimental::Types::UpdateCustomViewPeriodRequestPeriodKind }, optional: false, nullable: false

        field :unit, -> { Paid::CustomViewsExperimental::Types::UpdateCustomViewPeriodRequestPeriodUnit }, optional: true, nullable: false

        field :amount, -> { Integer }, optional: true, nullable: false

        field :start, -> { String }, optional: true, nullable: false

        field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
      end
    end
  end
end
