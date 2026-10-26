# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueSignalValue < Internal::Types::Model
      field :value_type_slug, -> { String }, optional: false, nullable: false, api_name: "valueTypeSlug"

      field :unit_value, -> { Float }, optional: true, nullable: false, api_name: "unitValue"

      field :monetary_value, -> { Float }, optional: false, nullable: false, api_name: "monetaryValue"
    end
  end
end
