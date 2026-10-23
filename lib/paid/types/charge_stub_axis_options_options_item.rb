# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ChargeStubAxisOptionsOptionsItem < Internal::Types::Model
      field :value, -> { Paid::Types::ChargeStubAxisOptionsOptionsItemValue }, optional: false, nullable: false

      field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isDefault"

      field :available, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :unavailable_reason, -> { String }, optional: true, nullable: false, api_name: "unavailableReason"
    end
  end
end
