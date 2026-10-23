# frozen_string_literal: true

module Paid
  module Amendments
    module Types
      class UnifiedAmendmentExecuteRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :order_version, -> { Integer }, optional: false, nullable: false, api_name: "orderVersion"

        field :intents, -> { Internal::Types::Array[Paid::Types::UnifiedAmendmentIntent] }, optional: false, nullable: false

        field :default_treatment, -> { Paid::Amendments::Types::UnifiedAmendmentExecuteRequestDefaultTreatment }, optional: true, nullable: false, api_name: "defaultTreatment"

        field :plan_hash, -> { String }, optional: true, nullable: false, api_name: "planHash"
      end
    end
  end
end
