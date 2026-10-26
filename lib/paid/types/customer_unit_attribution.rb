# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The customer unit (a node in the customer's internal hierarchy) this usage belongs to, by your key for the unit or
    # by an alias that points at it. Paid's unit ID is not accepted. Sent with `customer`, the unit must belong to that
    # customer. Omit to attribute to the customer only.
    class CustomerUnitAttribution < Internal::Types::Model
      field :external_customer_unit_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerUnitId"
    end
  end
end
