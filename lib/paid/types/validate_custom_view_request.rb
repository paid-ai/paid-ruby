# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValidateCustomViewRequest < Internal::Types::Model
      field :hierarchy_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hierarchyEnabled"

      field :caps_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "capsEnabled"

      field :queries, -> { Internal::Types::Array[Paid::Types::CustomViewQuery] }, optional: true, nullable: false

      field :render_bundle, -> { String }, optional: true, nullable: false, api_name: "renderBundle"

      field :period, -> { Paid::Types::ValidateCustomViewRequestPeriod }, optional: true, nullable: false

      field :filters, -> { Internal::Types::Array[Paid::Types::CustomViewFilter] }, optional: true, nullable: false

      field :scope, -> { Paid::Types::ValidateCustomViewRequestScope }, optional: true, nullable: false
    end
  end
end
