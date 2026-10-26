# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PlanRef < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"
    end
  end
end
