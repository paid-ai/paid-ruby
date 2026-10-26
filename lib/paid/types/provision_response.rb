# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionResponse < Internal::Types::Model
      field :status, -> { Paid::Types::ProvisionResponseStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :customer, -> { Paid::Types::ProvisionCreatedCustomer }, optional: false, nullable: false

      field :contact, -> { Paid::Types::ProvisionCreatedContact }, optional: true, nullable: false

      field :order, -> { Paid::Types::ProvisionCreatedOrder }, optional: false, nullable: false
    end
  end
end
