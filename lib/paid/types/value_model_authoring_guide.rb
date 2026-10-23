# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelAuthoringGuide < Internal::Types::Model
      field :overview, -> { String }, optional: false, nullable: false

      field :workflow, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :categories, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false

      field :units, -> { String }, optional: false, nullable: false

      field :formulas, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :signal_binding, -> { String }, optional: false, nullable: false, api_name: "signalBinding"

      field :monetary_conversion, -> { String }, optional: false, nullable: false, api_name: "monetaryConversion"

      field :concurrency, -> { String }, optional: false, nullable: false

      field :limitations, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :examples, -> { Internal::Types::Array[Paid::Types::ValueModelAuthoringGuideExamplesItem] }, optional: false, nullable: false
    end
  end
end
