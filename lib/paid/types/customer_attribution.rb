# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The customer, by Paid ID (`customerId`) or by your external ID (`externalCustomerId`).
    class CustomerAttribution < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::CustomerByID }

      member -> { Paid::Types::CustomerByExternalID }
    end
  end
end
