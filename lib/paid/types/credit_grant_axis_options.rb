# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditGrantAxisOptions < Internal::Types::Model
      field :relevance, -> { Paid::Types::AmendmentAxisRelevance }, optional: false, nullable: false

      field :options, -> { Internal::Types::Array[Paid::Types::CreditGrantAxisOptionsOptionsItem] }, optional: false, nullable: false
    end
  end
end
