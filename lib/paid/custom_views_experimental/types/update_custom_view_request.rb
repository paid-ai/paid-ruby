# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class UpdateCustomViewRequest < Internal::Types::Model
        field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

        field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

        field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

        field :name, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: true

        field :queries, -> { Internal::Types::Array[Paid::Types::CustomViewQuery] }, optional: true, nullable: false

        field :render_bundle, -> { String }, optional: true, nullable: false, api_name: "renderBundle"

        field :bundle_edits, -> { Internal::Types::Array[Paid::Types::RenderBundleEdit] }, optional: true, nullable: false, api_name: "bundleEdits"

        field :query_upserts, -> { Internal::Types::Array[Paid::Types::CustomViewQuery] }, optional: true, nullable: false, api_name: "queryUpserts"

        field :query_removals, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "queryRemovals"

        field :filters, -> { Internal::Types::Array[Paid::Types::CustomViewFilter] }, optional: true, nullable: true
      end
    end
  end
end
