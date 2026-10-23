# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitCapScheduleInputAnchorDay < Internal::Types::Model
      field :type, -> { Paid::Types::CustomerUnitCapScheduleInputAnchorDayType }, optional: false, nullable: false

      field :anchor_day, -> { Integer }, optional: false, nullable: false, api_name: "anchorDay"
    end
  end
end
