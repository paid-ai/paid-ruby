# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFormulasItemDefaultResult < Internal::Types::Model
      field :type, -> { Paid::Types::ValueModelContentFormulasItemDefaultResultType }, optional: false, nullable: false

      field :value, -> { Float }, optional: true, nullable: false

      field :expression, -> { String }, optional: true, nullable: false
    end
  end
end
