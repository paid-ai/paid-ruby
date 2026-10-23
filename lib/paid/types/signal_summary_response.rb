# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryResponse < Internal::Types::Model
      field :interval, -> { Paid::Types::SignalSummaryResponseInterval }, optional: false, nullable: false

      field :group_by, -> { Paid::Types::SignalSummaryResponseGroupBy }, optional: true, nullable: false, api_name: "groupBy"

      field :dimension_key, -> { String }, optional: true, nullable: false, api_name: "dimensionKey"

      field :groups, -> { Paid::Types::SignalSummaryGroups }, optional: true, nullable: false

      field :data, -> { Internal::Types::Array[Paid::Types::SignalSummaryPoint] }, optional: false, nullable: false

      field :pagination, -> { Paid::Types::SignalSummaryPage }, optional: false, nullable: false
    end
  end
end
