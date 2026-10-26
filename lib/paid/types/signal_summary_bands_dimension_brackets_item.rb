# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryBandsDimensionBracketsItem < Internal::Types::Model
      field :from, -> { Integer }, optional: true, nullable: false

      field :up_to, -> { Integer }, optional: false, nullable: true, api_name: "upTo"

      field :slug, -> { String }, optional: true, nullable: false

      field :group, -> { String }, optional: true, nullable: false
    end
  end
end
