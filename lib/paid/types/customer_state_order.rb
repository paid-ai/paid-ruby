# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerStateOrder < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :name, -> { String }, optional: false, nullable: false

      field :state, -> { Paid::Types::CustomerStateOrderState }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: true, api_name: "endDate"

      field :effective_until, -> { String }, optional: false, nullable: true, api_name: "effectiveUntil"
    end
  end
end
