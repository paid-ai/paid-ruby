# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UsageAttributionAxisOptions < Internal::Types::Model
      field :relevance, -> { Paid::Types::AmendmentAxisRelevance }, optional: false, nullable: false

      field :options, -> { Internal::Types::Array[Paid::Types::UsageAttributionAxisOptionsOptionsItem] }, optional: false, nullable: false
    end
  end
end
