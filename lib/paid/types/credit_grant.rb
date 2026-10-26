# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditGrant < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: false

      field :used, -> { Float }, optional: false, nullable: false

      field :total, -> { Float }, optional: false, nullable: false

      field :rollover_amount, -> { Float }, optional: false, nullable: true, api_name: "rolloverAmount"

      field :period_start, -> { String }, optional: false, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: true, api_name: "periodEnd"

      field :rollover_end_date, -> { String }, optional: false, nullable: true, api_name: "rolloverEndDate"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :is_in_rollover_window, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isInRolloverWindow"
    end
  end
end
