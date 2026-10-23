# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitCapEndResponse < Internal::Types::Model
      field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :policy, -> { Paid::Types::CustomerUnitCapEndedPolicy }, optional: false, nullable: true

      field :ended_versions, -> { Integer }, optional: false, nullable: false, api_name: "endedVersions"
    end
  end
end
