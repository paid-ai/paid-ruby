# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentSegmentTablesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :segment_keys, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "segmentKeys"

      field :columns, -> { Internal::Types::Array[Paid::Types::ValueModelContentSegmentTablesItemColumnsItem] }, optional: false, nullable: false

      field :rows, -> { Internal::Types::Array[Paid::Types::ValueModelContentSegmentTablesItemRowsItem] }, optional: false, nullable: false

      field :default_row, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: false, api_name: "defaultRow"
    end
  end
end
