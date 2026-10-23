# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentGroupingKeysItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :field, -> { String }, optional: false, nullable: false

      field :display_name, -> { String }, optional: false, nullable: false, api_name: "displayName"
    end
  end
end
