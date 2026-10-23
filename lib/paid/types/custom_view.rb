# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomView < Internal::Types::Model
      field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

      field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

      field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

      field :name, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::CustomViewStatus }, optional: false, nullable: false

      field :preview_url, -> { String }, optional: false, nullable: true, api_name: "previewUrl"

      field :scope, -> { Paid::Types::CustomViewScope }, optional: false, nullable: false
    end
  end
end
