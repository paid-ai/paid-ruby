# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueCalculation < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"

      field :terms, -> { Internal::Types::Array[Paid::Types::DeliveredValueCalculationTerm] }, optional: false, nullable: false

      field :unit_total, -> { Float }, optional: false, nullable: false, api_name: "unitTotal"
    end
  end
end
