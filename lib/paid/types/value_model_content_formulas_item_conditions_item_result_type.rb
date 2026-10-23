# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueModelContentFormulasItemConditionsItemResultType
      extend Paid::Internal::Types::Enum

      CONSTANT = "constant"
      EXPRESSION = "expression"
    end
  end
end
