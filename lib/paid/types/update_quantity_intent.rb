# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdateQuantityIntent < Internal::Types::Model
      field :order_line_attribute_id, -> { String }, optional: false, nullable: false, api_name: "orderLineAttributeId"

      field :new_quantity, -> { Integer }, optional: false, nullable: false, api_name: "newQuantity"

      field :treatment, -> { Paid::Types::UpdateQuantityIntentTreatment }, optional: true, nullable: false
    end
  end
end
