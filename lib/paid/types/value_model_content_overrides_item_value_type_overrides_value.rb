# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentOverridesItemValueTypeOverridesValue < Internal::Types::Model
      field :variables, -> { Internal::Types::Hash[String, Paid::Types::ValueModelContentOverridesItemValueTypeOverridesValueVariablesValue] }, optional: true, nullable: false
    end
  end
end
