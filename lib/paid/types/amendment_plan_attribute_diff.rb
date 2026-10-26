# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentPlanAttributeDiff < Internal::Types::Model
      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"

      field :change, -> { Paid::Types::AmendmentPlanChange }, optional: false, nullable: false

      field :order_line_attribute_id, -> { String }, optional: true, nullable: false, api_name: "orderLineAttributeId"

      field :order_line_id, -> { String }, optional: true, nullable: false, api_name: "orderLineId"

      field :before, -> { Paid::Types::AmendmentAttributeState }, optional: true, nullable: true

      field :after, -> { Paid::Types::AmendmentAttributeState }, optional: true, nullable: true

      field :governs_from, -> { String }, optional: true, nullable: false, api_name: "governsFrom"

      field :next_invoice_at, -> { String }, optional: true, nullable: false, api_name: "nextInvoiceAt"
    end
  end
end
