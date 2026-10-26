# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Stripe customer link, or null when no Stripe gateway account is configured.
    class StripeConnection < Internal::Types::Model
      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"
    end
  end
end
