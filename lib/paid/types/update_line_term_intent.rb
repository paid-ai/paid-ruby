# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdateLineTermIntent < Internal::Types::Model
      field :order_line_id, -> { String }, optional: false, nullable: false, api_name: "orderLineId"

      field :new_end_date, -> { String }, optional: false, nullable: false, api_name: "newEndDate"

      field :treatment, -> { Paid::Types::UpdateLineTermIntentTreatment }, optional: true, nullable: false
    end
  end
end
