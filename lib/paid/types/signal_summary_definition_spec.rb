# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The shape this export ran, stored here so the file stays explainable. Pass this export's id as copyFrom to
    # reproduce its columns.
    class SignalSummaryDefinitionSpec < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :interval, -> { Paid::Types::SignalSummaryDefinitionSpecInterval }, optional: true, nullable: false

      field :signal_names, -> { Internal::Types::Array[Paid::Types::SignalSummarySignalSelection] }, optional: false, nullable: false, api_name: "signalNames"

      field :dimensions, -> { Internal::Types::Array[Paid::Types::SignalSummaryDefinitionSpecDimensionsItem] }, optional: true, nullable: false

      field :measures, -> { Internal::Types::Array[Paid::Types::SignalSummaryMeasure] }, optional: false, nullable: false

      field :column_name_template, -> { String }, optional: true, nullable: false, api_name: "columnNameTemplate"
    end
  end
end
