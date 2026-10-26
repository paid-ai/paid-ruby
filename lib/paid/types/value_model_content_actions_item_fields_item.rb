# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentActionsItemFieldsItem < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :type, -> { Paid::Types::ValueModelContentActionsItemFieldsItemType }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :is_title, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isTitle"

      field :hidden, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
