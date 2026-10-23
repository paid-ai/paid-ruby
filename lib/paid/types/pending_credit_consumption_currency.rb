# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Credit currency the consumption is scoped to. Null when the usage may draw from any credit pool.
    class PendingCreditConsumptionCurrency < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
