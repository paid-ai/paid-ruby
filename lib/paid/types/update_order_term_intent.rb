# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdateOrderTermIntent < Internal::Types::Model
      field :new_end_date, -> { String }, optional: false, nullable: false, api_name: "newEndDate"

      field :extend_line_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "extendLineIds"

      field :treatment, -> { Paid::Types::UpdateOrderTermIntentTreatment }, optional: true, nullable: false
    end
  end
end
