# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Product < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :product_code, -> { String }, optional: false, nullable: true, api_name: "productCode"

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true
    end
  end
end
