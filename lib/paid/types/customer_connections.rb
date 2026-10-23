# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # Linked external system IDs for this customer.
    class CustomerConnections < Internal::Types::Model
      field :stripe, -> { Paid::Types::StripeConnection }, optional: false, nullable: true
    end
  end
end
