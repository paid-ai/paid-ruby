# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :value_type_slug, -> { String }, optional: false, nullable: false, api_name: "valueTypeSlug"

      field :label, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :variables, -> { Internal::Types::Array[Paid::Types::ValueModelContentFormulasItemVariablesItem] }, optional: false, nullable: false

      field :expression, -> { String }, optional: false, nullable: false

      field :conditions, -> { Internal::Types::Array[Paid::Types::ValueModelContentFormulasItemConditionsItem] }, optional: true, nullable: false

      field :default_result, -> { Paid::Types::ValueModelContentFormulasItemDefaultResult }, optional: true, nullable: false, api_name: "defaultResult"
    end
  end
end
