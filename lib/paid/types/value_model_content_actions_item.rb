# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentActionsItem < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false, api_name: "eventName"

      field :name, -> { String }, optional: false, nullable: false

      field :fields, -> { Internal::Types::Array[Paid::Types::ValueModelContentActionsItemFieldsItem] }, optional: false, nullable: false
    end
  end
end
