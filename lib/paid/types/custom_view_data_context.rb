# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # What these rows were read for. The render bundle receives this object as `context` in the `paid:data` message.
    class CustomViewDataContext < Internal::Types::Model
      field :version, -> { Integer }, optional: true, nullable: false

      field :unit_selection, -> { Paid::Types::CustomViewUnitSelection }, optional: false, nullable: false, api_name: "unitSelection"

      field :period, -> { Paid::Types::CustomViewDataContextPeriod }, optional: false, nullable: true

      field :units, -> { Internal::Types::Array[Paid::Types::CustomViewCustomerUnit] }, optional: true, nullable: false

      field :units_total, -> { Integer }, optional: true, nullable: false, api_name: "unitsTotal"

      field :units_truncated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "unitsTruncated"

      field :caps, -> { Internal::Types::Array[Paid::Types::CustomViewContextCap] }, optional: true, nullable: false

      field :caps_total, -> { Integer }, optional: true, nullable: false, api_name: "capsTotal"

      field :caps_truncated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsTruncated"

      field :caps_unavailable, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsUnavailable"
    end
  end
end
