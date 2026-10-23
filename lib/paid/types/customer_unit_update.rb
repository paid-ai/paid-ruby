# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitUpdate < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :external_type, -> { String }, optional: true, nullable: true, api_name: "externalType"

      field :parent_external_id, -> { String }, optional: true, nullable: false, api_name: "parentExternalId"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :billable, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
