# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # If supplied, overrides server-side pricing. The usage breakdown is still recorded for analytics.
    class CostOverride < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false
    end
  end
end
