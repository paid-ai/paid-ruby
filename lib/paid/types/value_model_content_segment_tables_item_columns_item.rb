# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentSegmentTablesItemColumnsItem < Internal::Types::Model
      field :variable_id, -> { String }, optional: false, nullable: false, api_name: "variableId"

      field :label, -> { String }, optional: false, nullable: false

      field :type, -> { Paid::Types::ValueModelContentSegmentTablesItemColumnsItemType }, optional: false, nullable: false
    end
  end
end
