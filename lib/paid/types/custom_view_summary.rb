# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewSummary < Internal::Types::Model
      field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

      field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

      field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :status, -> { Paid::Types::CustomViewSummaryStatus }, optional: false, nullable: false

      field :query_count, -> { Integer }, optional: false, nullable: false, api_name: "queryCount"

      field :period, -> { Paid::Types::CustomViewSummaryPeriod }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :scope, -> { Paid::Types::CustomViewSummaryScope }, optional: false, nullable: false
    end
  end
end
