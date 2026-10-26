# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class UpdatePlanRequest < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :external_id, -> { String }, optional: true, nullable: true, api_name: "externalId"

      field :supported_currencies, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "supportedCurrencies"

      field :is_default, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isDefault"

      field :status, -> { Paid::Types::UpdatePlanRequestStatus }, optional: true, nullable: false

      field :attributes, -> { Internal::Types::Array[Paid::Types::PlanAttributeInput] }, optional: true, nullable: false
    end
  end
end
