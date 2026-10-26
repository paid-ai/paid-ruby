# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryBandsDimension < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false

      field :applies_to, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "appliesTo"

      field :brackets, -> { Internal::Types::Array[Paid::Types::SignalSummaryBandsDimensionBracketsItem] }, optional: false, nullable: false

      field :overflow_slug, -> { String }, optional: true, nullable: false, api_name: "overflowSlug"
    end
  end
end
