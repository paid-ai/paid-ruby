# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AnalyticsSchemaResponse < Internal::Types::Model
      field :views, -> { Internal::Types::Array[Paid::Types::AnalyticsSchemaView] }, optional: false, nullable: false
    end
  end
end
