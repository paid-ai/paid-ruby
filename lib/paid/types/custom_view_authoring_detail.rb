# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewAuthoringDetail < Internal::Types::Model
      field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

      field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

      field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :status, -> { Paid::Types::CustomViewAuthoringDetailStatus }, optional: false, nullable: false

      field :query_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "queryIds"

      field :render_bundle, -> { String }, optional: false, nullable: false, api_name: "renderBundle"

      field :period, -> { Paid::Types::CustomViewAuthoringDetailPeriod }, optional: false, nullable: true

      field :filters, -> { Internal::Types::Array[Paid::Types::CustomViewFilter] }, optional: false, nullable: true

      field :scope, -> { Paid::Types::CustomViewAuthoringDetailScope }, optional: false, nullable: false

      field :queries, -> { Internal::Types::Array[Paid::Types::CustomViewQuery] }, optional: false, nullable: false

      field :created_by, -> { String }, optional: false, nullable: false, api_name: "createdBy"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :schema_version, -> { Integer }, optional: false, nullable: false, api_name: "schemaVersion"

      field :guide, -> { String }, optional: true, nullable: false

      field :sample_bundle, -> { String }, optional: true, nullable: false, api_name: "sampleBundle"
    end
  end
end
