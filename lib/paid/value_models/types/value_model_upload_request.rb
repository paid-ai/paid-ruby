# frozen_string_literal: true

module Paid
  module ValueModels
    module Types
      class ValueModelUploadRequest < Internal::Types::Model
        field :content, -> { Paid::Types::ValueModelContent }, optional: false, nullable: false

        field :effective_from, -> { String }, optional: true, nullable: false, api_name: "effectiveFrom"

        field :effective_to, -> { String }, optional: true, nullable: false, api_name: "effectiveTo"

        field :expected_active_version, -> { Integer }, optional: true, nullable: false, api_name: "expectedActiveVersion"
      end
    end
  end
end
