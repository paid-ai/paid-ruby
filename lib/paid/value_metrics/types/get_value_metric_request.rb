# frozen_string_literal: true

module Paid
  module ValueMetrics
    module Types
      class GetValueMetricRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false
      end
    end
  end
end
