# frozen_string_literal: true

module Paid
  module ValueMetrics
    module Types
      class ArchiveValueMetricRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :expected_active_version, -> { Integer }, optional: true, nullable: false, api_name: "expectedActiveVersion"
      end
    end
  end
end
