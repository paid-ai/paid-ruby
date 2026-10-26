# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentOverridesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :scope, -> { Paid::Types::ValueModelContentOverridesItemScope }, optional: false, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :value_type_overrides, -> { Internal::Types::Hash[String, Paid::Types::ValueModelContentOverridesItemValueTypeOverridesValue] }, optional: true, nullable: false, api_name: "valueTypeOverrides"

      field :additional_signals, -> { Internal::Types::Array[Paid::Types::ValueModelContentOverridesItemAdditionalSignalsItem] }, optional: true, nullable: false, api_name: "additionalSignals"

      field :monetary_conversion_overrides, -> { Internal::Types::Hash[String, Paid::Types::ValueModelContentOverridesItemMonetaryConversionOverridesValue] }, optional: true, nullable: false, api_name: "monetaryConversionOverrides"
    end
  end
end
