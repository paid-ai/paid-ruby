# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class ProvisionRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "idempotency-key"

        field :external_reference, -> { Paid::Types::ProvisionExternalReference }, optional: false, nullable: false, api_name: "externalReference"

        field :customer, -> { Paid::Types::ProvisionCustomer }, optional: false, nullable: false

        field :contact, -> { Paid::Types::ProvisionContact }, optional: true, nullable: false

        field :order, -> { Paid::Types::ProvisionOrder }, optional: false, nullable: false
      end
    end
  end
end
