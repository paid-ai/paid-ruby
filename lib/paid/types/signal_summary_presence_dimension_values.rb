# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryPresenceDimensionValues < Internal::Types::Model
      field :true_, -> { Paid::Types::SignalSummaryPresenceDimensionValuesTrue }, optional: false, nullable: false, api_name: "true"

      field :false_, -> { Paid::Types::SignalSummaryPresenceDimensionValuesFalse }, optional: false, nullable: false, api_name: "false"
    end
  end
end
