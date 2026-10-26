# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class GetPlanByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"
      end
    end
  end
end
