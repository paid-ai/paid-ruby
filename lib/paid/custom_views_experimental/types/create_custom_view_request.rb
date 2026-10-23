# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class CreateCustomViewRequest < Internal::Types::Model
        field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

        field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

        field :name, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :queries, -> { Internal::Types::Array[Paid::Types::CustomViewQuery] }, optional: false, nullable: false

        field :render_bundle, -> { String }, optional: false, nullable: false, api_name: "renderBundle"

        field :period, -> { Paid::CustomViewsExperimental::Types::CreateCustomViewRequestPeriod }, optional: true, nullable: false

        field :filters, -> { Internal::Types::Array[Paid::Types::CustomViewFilter] }, optional: true, nullable: false

        field :scope, -> { Paid::CustomViewsExperimental::Types::CreateCustomViewRequestScope }, optional: true, nullable: false
      end
    end
  end
end
