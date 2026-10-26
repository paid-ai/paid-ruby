# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The product this usage is for, by Paid ID or by your external ID. Optional.
    class Attribution < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::ProductByID }

      member -> { Paid::Types::ProductByExternalID }
    end
  end
end
