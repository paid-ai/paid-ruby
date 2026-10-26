# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProductAttribution < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::ProductByID }

      member -> { Paid::Types::ProductByExternalID }
    end
  end
end
