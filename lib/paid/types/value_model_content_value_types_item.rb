# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentValueTypesItem < Internal::Types::Model
      field :slug, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :calculation_timeline, -> { Internal::Types::Array[Paid::Types::ValueModelContentValueTypesItemCalculationTimelineItem] }, optional: false, nullable: false, api_name: "calculationTimeline"

      field :description, -> { String }, optional: true, nullable: true

      field :long_description, -> { String }, optional: true, nullable: true, api_name: "longDescription"

      field :sources, -> { Internal::Types::Array[Paid::Types::ValueModelContentValueTypesItemSourcesItem] }, optional: true, nullable: true

      field :maturation, -> { Object }, optional: true, nullable: true

      field :display_order, -> { Integer }, optional: true, nullable: true, api_name: "displayOrder"

      field :color, -> { String }, optional: true, nullable: true

      field :icon, -> { String }, optional: true, nullable: true

      field :category, -> { Paid::Types::ValueModelContentValueTypesItemCategory }, optional: true, nullable: true

      field :archived_at, -> { String }, optional: true, nullable: true, api_name: "archivedAt"
    end
  end
end
