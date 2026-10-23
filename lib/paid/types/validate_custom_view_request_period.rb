# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Period to validate together with the queries (required when a query uses the {period_start}/{period_end}
    # placeholders).
    class ValidateCustomViewRequestPeriod < Internal::Types::Model
      field :kind, -> { Paid::Types::ValidateCustomViewRequestPeriodKind }, optional: false, nullable: false

      field :unit, -> { Paid::Types::ValidateCustomViewRequestPeriodUnit }, optional: true, nullable: false

      field :amount, -> { Integer }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
    end
  end
end
