# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItemVariablesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :type, -> { Paid::Types::ValueModelContentFormulasItemVariablesItemType }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :format, -> { Paid::Types::ValueModelContentFormulasItemVariablesItemFormat }, optional: true, nullable: false

      field :format_unit, -> { Paid::Types::ValueModelContentFormulasItemVariablesItemFormatUnit }, optional: true, nullable: false, api_name: "formatUnit"

      field :derived_from, -> { Paid::Types::ValueModelContentFormulasItemVariablesItemDerivedFrom }, optional: true, nullable: false, api_name: "derivedFrom"
    end
  end
end
