# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Usage in the current period, when the returned version is in force now and usage is available; otherwise `null`.
    class CustomerUnitCapCurrentPeriod < Internal::Types::Model
      field :window, -> { Paid::Types::CustomerUnitCapPeriod }, optional: false, nullable: false

      field :used, -> { Float }, optional: false, nullable: false

      field :remaining, -> { Float }, optional: false, nullable: false
    end
  end
end
