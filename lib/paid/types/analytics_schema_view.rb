# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AnalyticsSchemaView < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :comment, -> { String }, optional: false, nullable: false

      field :columns, -> { Internal::Types::Array[Paid::Types::AnalyticsSchemaColumn] }, optional: false, nullable: false
    end
  end
end
