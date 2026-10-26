# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItemConditionsItemResult < Internal::Types::Model
      field :type, -> { Paid::Types::ValueModelContentFormulasItemConditionsItemResultType }, optional: false, nullable: false

      field :value, -> { Float }, optional: true, nullable: false

      field :expression, -> { String }, optional: true, nullable: false
    end
  end
end
