# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The order, matched by `externalId`. Its lines are set from this payload each time you provision it. A draft order
    # can have no lines; an active order needs at least one.
    class ProvisionOrder < Internal::Types::Model
      field :currency, -> { String }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

      field :status, -> { Paid::Types::ProvisionOrderStatus }, optional: true, nullable: false

      field :billing_anchor, -> { Integer }, optional: true, nullable: true, api_name: "billingAnchor"

      field :billing_customer_external_id, -> { String }, optional: true, nullable: false, api_name: "billingCustomerExternalId"

      field :billing_contact_external_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "billingContactExternalIds"

      field :payment_terms, -> { Paid::Types::ProvisionOrderPaymentTerms }, optional: true, nullable: false, api_name: "paymentTerms"

      field :name, -> { String }, optional: true, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :lines, -> { Internal::Types::Array[Paid::Types::ProvisionOrderLine] }, optional: false, nullable: false

      field :billing_frequency_override, -> { Paid::Types::ProvisionBillingFrequencyOverride }, optional: true, nullable: false, api_name: "billingFrequencyOverride"

      field :historical_replay_until, -> { String }, optional: true, nullable: false, api_name: "historicalReplayUntil"
    end
  end
end
