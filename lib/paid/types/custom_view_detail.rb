# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewDetail < Internal::Types::Model
      field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

      field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

      field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :status, -> { Paid::Types::CustomViewDetailStatus }, optional: false, nullable: false

      field :query_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "queryIds"

      field :render_bundle, -> { String }, optional: false, nullable: false, api_name: "renderBundle"

      field :period, -> { Paid::Types::CustomViewDetailPeriod }, optional: false, nullable: true

      field :filters, -> { Internal::Types::Array[Paid::Types::CustomViewFilter] }, optional: false, nullable: true

      field :scope, -> { Paid::Types::CustomViewDetailScope }, optional: false, nullable: false
    end
  end
end
