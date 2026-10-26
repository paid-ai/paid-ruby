# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Advanced add with caller-authored pricing. Prefer `addFromCatalog` unless you need a raw pricing payload.
    class AddAttributeIntent < Internal::Types::Model
      field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

      field :plan_product_id, -> { String }, optional: true, nullable: false, api_name: "planProductId"

      field :product_attribute_id, -> { String }, optional: true, nullable: false, api_name: "productAttributeId"

      field :line_name, -> { String }, optional: false, nullable: false, api_name: "lineName"

      field :pricing, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :quantity, -> { Integer }, optional: false, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :charge_stub, -> { Paid::Types::AddAttributeIntentChargeStub }, optional: true, nullable: false, api_name: "chargeStub"

      field :credit_grant, -> { Paid::Types::AddAttributeIntentCreditGrant }, optional: true, nullable: false, api_name: "creditGrant"

      field :treatment, -> { Paid::Types::AddAttributeIntentTreatment }, optional: true, nullable: false
    end
  end
end
