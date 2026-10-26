# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerUnitCapResponse < Internal::Types::Model
      field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :credits_currency_id, -> { String }, optional: false, nullable: false, api_name: "creditsCurrencyId"

      field :policy, -> { Paid::Types::CustomerUnitCapPolicy }, optional: false, nullable: false

      field :current_period, -> { Paid::Types::CustomerUnitCapCurrentPeriod }, optional: false, nullable: true, api_name: "currentPeriod"
    end
  end
end
