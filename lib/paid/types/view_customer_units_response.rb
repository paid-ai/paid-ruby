# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ViewCustomerUnitsResponse < Internal::Types::Model
      field :has_hierarchy, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasHierarchy"

      field :data, -> { Internal::Types::Array[Paid::Types::CustomViewCustomerUnit] }, optional: false, nullable: false

      field :pagination, -> { Paid::Types::Pagination }, optional: false, nullable: false
    end
  end
end
