# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditBalanceListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::CreditBalance] }, optional: false, nullable: false
    end
  end
end
