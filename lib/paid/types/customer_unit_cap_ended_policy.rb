# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The cap version that was in force at the time of the call, now ended (`effectiveUntil` set). `null` when no
    # version was in force — only scheduled versions were ended.
    class CustomerUnitCapEndedPolicy < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :frequency, -> { Paid::Types::CustomerUnitCapEndedPolicyFrequency }, optional: false, nullable: false

      field :schedule, -> { Paid::Types::CustomerUnitCapSchedule }, optional: false, nullable: false

      field :effective_from, -> { String }, optional: false, nullable: false, api_name: "effectiveFrom"

      field :effective_until, -> { String }, optional: false, nullable: false, api_name: "effectiveUntil"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :source, -> { String }, optional: false, nullable: false
    end
  end
end
