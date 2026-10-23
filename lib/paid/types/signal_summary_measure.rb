# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryMeasure < Internal::Types::Model
      field :fn, -> { Paid::Types::SignalSummaryMeasureFn }, optional: false, nullable: false

      field :path, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
