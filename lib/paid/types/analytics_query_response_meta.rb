# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AnalyticsQueryResponseMeta < Internal::Types::Model
      field :row_count, -> { Integer }, optional: false, nullable: false, api_name: "rowCount"

      field :elapsed_ms, -> { Float }, optional: false, nullable: false, api_name: "elapsedMs"

      field :truncated, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
