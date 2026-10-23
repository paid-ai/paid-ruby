# frozen_string_literal: true

module Paid
  module ValueMetrics
    module Types
      class ListValueMetricsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :include_archived, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeArchived"
      end
    end
  end
end
