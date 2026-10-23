# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryColumn < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :signal_group, -> { String }, optional: false, nullable: false, api_name: "signalGroup"

      field :dimension_group, -> { String }, optional: false, nullable: true, api_name: "dimensionGroup"
    end
  end
end
