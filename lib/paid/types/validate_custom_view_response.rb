# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValidateCustomViewResponse < Internal::Types::Model
      field :valid, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :findings, -> { Internal::Types::Array[Paid::Types::CustomViewValidationFinding] }, optional: false, nullable: false
    end
  end
end
