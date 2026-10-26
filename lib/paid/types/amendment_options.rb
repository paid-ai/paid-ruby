# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentOptions < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :order_version, -> { Float }, optional: false, nullable: false, api_name: "orderVersion"

      field :currency, -> { String }, optional: false, nullable: false

      field :effective_date, -> { String }, optional: false, nullable: false, api_name: "effectiveDate"

      field :amendable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :not_amendable_code, -> { String }, optional: true, nullable: false, api_name: "notAmendableCode"

      field :not_amendable_reason, -> { String }, optional: true, nullable: false, api_name: "notAmendableReason"

      field :lines, -> { Internal::Types::Array[Paid::Types::AmendmentLineOptions] }, optional: false, nullable: false

      field :add_attribute, -> { Paid::Types::AmendmentAddAttributeOptions }, optional: false, nullable: false, api_name: "addAttribute"

      field :stub_period_exists, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "stubPeriodExists"

      field :order_term, -> { Paid::Types::AmendmentIntentOptions }, optional: true, nullable: false, api_name: "orderTerm"

      field :current_period_end, -> { String }, optional: true, nullable: false, api_name: "currentPeriodEnd"
    end
  end
end
