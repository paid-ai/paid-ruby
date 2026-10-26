# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionCreatedContact < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :provision_status, -> { Paid::Types::ProvisionCreatedContactProvisionStatus }, optional: false, nullable: false, api_name: "provisionStatus"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
