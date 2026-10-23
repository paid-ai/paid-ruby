# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerAPIKeyCreate < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
    end
  end
end
