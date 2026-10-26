# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewUnitSelectionZero < Internal::Types::Model
      field :mode, -> { Paid::Types::CustomViewUnitSelectionZeroMode }, optional: false, nullable: false
    end
  end
end
