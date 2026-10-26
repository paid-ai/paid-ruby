# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionCreatedOrder < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :lines, -> { Internal::Types::Array[Paid::Types::ProvisionCreatedOrderLine] }, optional: false, nullable: false

      field :provision_status, -> { Paid::Types::ProvisionCreatedOrderProvisionStatus }, optional: false, nullable: false, api_name: "provisionStatus"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :billing_frequency_override, -> { Paid::Types::ProvisionBillingFrequencyOverride }, optional: true, nullable: false, api_name: "billingFrequencyOverride"
    end
  end
end
