# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryPresenceDimensionValuesTrue < Internal::Types::Model
      field :group, -> { String }, optional: false, nullable: false

      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
