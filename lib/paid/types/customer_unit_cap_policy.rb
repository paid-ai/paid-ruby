# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The cap version in force now.
    class CustomerUnitCapPolicy < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :frequency, -> { Paid::Types::CustomerUnitCapPolicyFrequency }, optional: false, nullable: false

      field :schedule, -> { Paid::Types::CustomerUnitCapSchedule }, optional: false, nullable: false

      field :effective_from, -> { String }, optional: false, nullable: false, api_name: "effectiveFrom"

      field :effective_until, -> { String }, optional: false, nullable: true, api_name: "effectiveUntil"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :source, -> { String }, optional: false, nullable: false
    end
  end
end
