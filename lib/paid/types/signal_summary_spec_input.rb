# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The shape of the file: which signals to count, how to break them down, and what each column is called. Required
    # unless copyFrom is given.
    class SignalSummarySpecInput < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :interval, -> { Paid::Types::SignalSummarySpecInputInterval }, optional: true, nullable: false

      field :signal_names, -> { Internal::Types::Array[Paid::Types::SignalSummarySignalSelection] }, optional: false, nullable: false, api_name: "signalNames"

      field :dimensions, -> { Internal::Types::Array[Paid::Types::SignalSummarySpecInputDimensionsItem] }, optional: true, nullable: false

      field :measures, -> { Internal::Types::Array[Paid::Types::SignalSummaryMeasure] }, optional: false, nullable: false

      field :column_name_template, -> { String }, optional: true, nullable: false, api_name: "columnNameTemplate"
    end
  end
end
