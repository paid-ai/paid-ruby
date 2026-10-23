# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentSegmentTablesItemRowsItem < Internal::Types::Model
      field :segment_values, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false, api_name: "segmentValues"

      field :variables, -> { Internal::Types::Hash[String, Float] }, optional: false, nullable: false
    end
  end
end
