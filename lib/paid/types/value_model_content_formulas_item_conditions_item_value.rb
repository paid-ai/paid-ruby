# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItemConditionsItemValue < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Float }

      member -> { String }

      member -> { Internal::Types::Boolean }
    end
  end
end
