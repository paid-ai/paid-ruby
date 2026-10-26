# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueModelContentFormulasItemVariablesItemType
      extend Paid::Internal::Types::Enum

      NUMBER = "number"
      STRING = "string"
      BOOLEAN = "boolean"
      DURATION = "duration"
    end
  end
end
