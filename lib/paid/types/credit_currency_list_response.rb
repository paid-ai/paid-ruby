# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditCurrencyListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::CreditCurrency] }, optional: false, nullable: false
    end
  end
end
