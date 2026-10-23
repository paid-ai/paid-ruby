# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PricingListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::PricingResponse] }, optional: false, nullable: false
    end
  end
end
