# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The signal that feeds a metric. A metric has exactly one on this surface, matching Value Studio. On update,
    # supplying it replaces the existing binding rather than merging into it.
    class ValueMetricSignalBinding < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :label, -> { String }, optional: true, nullable: false

      field :defaults, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :labels, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
