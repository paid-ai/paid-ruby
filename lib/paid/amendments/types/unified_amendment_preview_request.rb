# frozen_string_literal: true

module Paid
  module Amendments
    module Types
      class UnifiedAmendmentPreviewRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :order_version, -> { Integer }, optional: false, nullable: false, api_name: "orderVersion"

        field :intents, -> { Internal::Types::Array[Paid::Types::UnifiedAmendmentIntent] }, optional: false, nullable: false

        field :default_treatment, -> { Paid::Amendments::Types::UnifiedAmendmentPreviewRequestDefaultTreatment }, optional: true, nullable: false, api_name: "defaultTreatment"
      end
    end
  end
end
