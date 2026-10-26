# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UsageBracketedPrepaidCreditsInputCreditUnitBracketsItem < Internal::Types::Model
      field :up_to, -> { Integer }, optional: false, nullable: true, api_name: "upTo"

      field :credit_units, -> { Float }, optional: false, nullable: false, api_name: "creditUnits"

      field :credit_units_per_unit, -> { Float }, optional: true, nullable: false, api_name: "creditUnitsPerUnit"
    end
  end
end
