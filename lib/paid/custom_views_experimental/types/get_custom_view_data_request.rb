# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class GetCustomViewDataRequest < Internal::Types::Model
        field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :period_kind, -> { Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestPeriodKind }, optional: true, nullable: false, api_name: "periodKind"

        field :period_unit, -> { Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestPeriodUnit }, optional: true, nullable: false, api_name: "periodUnit"

        field :period_amount, -> { Integer }, optional: true, nullable: false, api_name: "periodAmount"

        field :period_start, -> { String }, optional: true, nullable: false, api_name: "periodStart"

        field :period_end, -> { String }, optional: true, nullable: false, api_name: "periodEnd"

        field :include_draft, -> { Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestIncludeDraft }, optional: true, nullable: false, api_name: "includeDraft"

        field :unit_mode, -> { Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestUnitMode }, optional: true, nullable: false, api_name: "unitMode"

        field :unit_external_id, -> { String }, optional: true, nullable: false, api_name: "unitExternalId"
      end
    end
  end
end
