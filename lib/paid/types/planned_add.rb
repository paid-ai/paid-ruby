# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Attribute the amendment adds.
    class PlannedAdd < Internal::Types::Model
      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"

      field :line_name, -> { String }, optional: true, nullable: false, api_name: "lineName"

      field :line_type, -> { Paid::Types::AmendmentPlanLineType }, optional: true, nullable: false, api_name: "lineType"

      field :product_id, -> { String }, optional: true, nullable: false, api_name: "productId"

      field :product_attribute_id, -> { String }, optional: true, nullable: false, api_name: "productAttributeId"

      field :quantity, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :charge_stub, -> { Paid::Types::PlannedAddChargeStub }, optional: true, nullable: false, api_name: "chargeStub"

      field :credit_grant, -> { Paid::Types::CreditGrantValue }, optional: true, nullable: false, api_name: "creditGrant"
    end
  end
end
