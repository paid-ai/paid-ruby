# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Plan < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :product_id, -> { String }, optional: false, nullable: false, api_name: "productId"

      field :name, -> { String }, optional: false, nullable: true

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :supported_currencies, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "supportedCurrencies"

      field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isDefault"

      field :status, -> { Paid::Types::PlanStatus }, optional: false, nullable: false

      field :upgrade_path_order, -> { Float }, optional: false, nullable: true, api_name: "upgradePathOrder"

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :attributes, -> { Internal::Types::Array[Paid::Types::PlanAttribute] }, optional: false, nullable: false
    end
  end
end
