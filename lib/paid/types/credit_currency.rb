# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CreditCurrency < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::CreditCurrencyStatus }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
