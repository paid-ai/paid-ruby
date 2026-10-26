# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitCapSet < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :frequency, -> { Paid::Types::CustomerUnitCapSetFrequency }, optional: true, nullable: false

      field :schedule, -> { Paid::Types::CustomerUnitCapScheduleInput }, optional: true, nullable: false

      field :credits_currency_id, -> { String }, optional: true, nullable: false, api_name: "creditsCurrencyId"

      field :effective_from, -> { String }, optional: true, nullable: false, api_name: "effectiveFrom"
    end
  end
end
