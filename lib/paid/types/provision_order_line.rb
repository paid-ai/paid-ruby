# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionOrderLine < Internal::Types::Model
      field :product, -> { Paid::Types::ProvisionProduct }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

      field :attributes, -> { Internal::Types::Array[Paid::Types::ProvisionOrderLineAttribute] }, optional: true, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :line_type, -> { Paid::Types::WritableProvisionOrderLineType }, optional: true, nullable: false, api_name: "lineType"
    end
  end
end
