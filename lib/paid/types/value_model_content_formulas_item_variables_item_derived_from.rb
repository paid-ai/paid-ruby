# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItemVariablesItemDerivedFrom < Internal::Types::Model
      field :source_field, -> { String }, optional: false, nullable: false, api_name: "sourceField"

      field :target_unit, -> { Paid::Types::ValueModelContentFormulasItemVariablesItemDerivedFromTargetUnit }, optional: false, nullable: false, api_name: "targetUnit"

      field :source_unit, -> { Paid::Types::ValueModelContentFormulasItemVariablesItemDerivedFromSourceUnit }, optional: true, nullable: false, api_name: "sourceUnit"

      field :source_unit_from_signal, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sourceUnitFromSignal"
    end
  end
end
