# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItemConditionsItem < Internal::Types::Model
      field :field, -> { String }, optional: false, nullable: false

      field :operator, -> { Paid::Types::ValueModelContentFormulasItemConditionsItemOperator }, optional: false, nullable: false

      field :value, -> { Paid::Types::ValueModelContentFormulasItemConditionsItemValue }, optional: false, nullable: false

      field :result, -> { Paid::Types::ValueModelContentFormulasItemConditionsItemResult }, optional: false, nullable: false
    end
  end
end
