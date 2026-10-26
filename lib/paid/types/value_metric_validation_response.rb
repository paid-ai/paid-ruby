# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricValidationResponse < Internal::Types::Model
      field :valid, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Paid::Types::ValueMetricValidationResponseErrorsItem] }, optional: false, nullable: false
    end
  end
end
