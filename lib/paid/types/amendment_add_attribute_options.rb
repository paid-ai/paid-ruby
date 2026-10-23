# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Axes for adding an attribute mid-cycle.
    class AmendmentAddAttributeOptions < Internal::Types::Model
      field :axes, -> { Internal::Types::Array[Paid::Types::AmendmentAddAxisOptions] }, optional: false, nullable: false
    end
  end
end
