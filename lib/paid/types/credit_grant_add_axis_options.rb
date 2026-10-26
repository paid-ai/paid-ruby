# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditGrantAddAxisOptions < Internal::Types::Model
      field :relevance, -> { Paid::Types::AmendmentAxisRelevance }, optional: false, nullable: false

      field :applies_to, -> { Internal::Types::Array[Paid::Types::AmendmentPricingClause] }, optional: false, nullable: false, api_name: "appliesTo"

      field :options, -> { Internal::Types::Array[Paid::Types::CreditGrantAddAxisOptionsOptionsItem] }, optional: false, nullable: false
    end
  end
end
