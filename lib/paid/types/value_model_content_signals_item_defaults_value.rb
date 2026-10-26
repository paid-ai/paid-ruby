# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentSignalsItemDefaultsValue < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Float }

      member -> { String }
    end
  end
end
