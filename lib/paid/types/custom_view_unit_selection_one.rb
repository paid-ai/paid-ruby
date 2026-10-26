# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewUnitSelectionOne < Internal::Types::Model
      field :mode, -> { Paid::Types::CustomViewUnitSelectionOneMode }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
