# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class UpdateCustomViewPeriodRequest < Internal::Types::Model
        field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

        field :period, -> { Paid::CustomViewsExperimental::Types::UpdateCustomViewPeriodRequestPeriod }, optional: false, nullable: false
      end
    end
  end
end
