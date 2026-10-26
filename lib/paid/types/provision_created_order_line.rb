# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionCreatedOrderLine < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :provision_status, -> { Paid::Types::ProvisionCreatedOrderLineProvisionStatus }, optional: false, nullable: false, api_name: "provisionStatus"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :line_type, -> { Paid::Types::ProvisionOrderLineType }, optional: false, nullable: false, api_name: "lineType"
    end
  end
end
