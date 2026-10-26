# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryPresenceDimension < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false

      field :applies_to, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "appliesTo"

      field :values, -> { Paid::Types::SignalSummaryPresenceDimensionValues }, optional: false, nullable: false
    end
  end
end
