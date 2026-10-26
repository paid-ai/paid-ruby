# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueCalculationTerm < Internal::Types::Model
      field :operator, -> { Paid::Types::DeliveredValueCalculationTermOperator }, optional: true, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :value, -> { Float }, optional: false, nullable: false

      field :format, -> { Paid::Types::DeliveredValueCalculationTermFormat }, optional: true, nullable: false

      field :format_unit, -> { Paid::Types::DeliveredValueCalculationTermFormatUnit }, optional: true, nullable: false, api_name: "formatUnit"
    end
  end
end
