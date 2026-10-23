# frozen_string_literal: true

module Paid
  module Costs
    module Types
      class CostIngestRequest < Internal::Types::Model
        field :costs, -> { Internal::Types::Array[Paid::Types::Cost] }, optional: false, nullable: false
      end
    end
  end
end
