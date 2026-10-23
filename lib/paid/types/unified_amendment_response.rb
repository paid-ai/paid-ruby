# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UnifiedAmendmentResponse < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :amendment_id, -> { String }, optional: false, nullable: false, api_name: "amendmentId"

      field :version, -> { Float }, optional: false, nullable: false

      field :effective_date, -> { String }, optional: false, nullable: false, api_name: "effectiveDate"

      field :ended_line_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: true, api_name: "endedLineIds"

      field :created_line_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: true, api_name: "createdLineIds"

      field :plan, -> { Paid::Types::AmendmentPlan }, optional: false, nullable: true
    end
  end
end
