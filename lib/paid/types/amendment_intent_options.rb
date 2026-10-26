# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentIntentOptions < Internal::Types::Model
      field :kind, -> { Paid::Types::AmendmentIntentKind }, optional: false, nullable: false

      field :axes, -> { Internal::Types::Array[Paid::Types::AmendmentAxisOptions] }, optional: false, nullable: false
    end
  end
end
