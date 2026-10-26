# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateCreditSummary < Internal::Types::Model
      field :balances, -> { Internal::Types::Array[Paid::Types::CustomerStateCreditBalance] }, optional: false, nullable: false
    end
  end
end
