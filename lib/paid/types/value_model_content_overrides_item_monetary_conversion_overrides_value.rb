# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentOverridesItemMonetaryConversionOverridesValue < Internal::Types::Model
      field :variables, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: false
    end
  end
end
