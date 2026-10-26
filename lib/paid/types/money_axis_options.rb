# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class MoneyAxisOptions < Internal::Types::Model
      field :relevance, -> { Paid::Types::AmendmentAxisRelevance }, optional: false, nullable: false

      field :options, -> { Internal::Types::Array[Paid::Types::MoneyAxisOptionsOptionsItem] }, optional: false, nullable: false
    end
  end
end
