# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class UpdatePlanByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :body, -> { Paid::Types::UpdatePlanRequest }, optional: false, nullable: false
      end
    end
  end
end
