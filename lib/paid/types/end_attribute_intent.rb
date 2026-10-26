# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class EndAttributeIntent < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :treatment, -> { Paid::Types::EndAttributeIntentTreatment }, optional: true, nullable: false
    end
  end
end
