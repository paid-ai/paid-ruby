# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricValidationResponseErrorsItem < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
