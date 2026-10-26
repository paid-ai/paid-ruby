# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # All customer activity, one unit's direct activity, or that unit and its current descendants. A display filter
    # within the authorized customer, not an access restriction. In a data context, a selected unit also carries its
    # display name.
    class CustomViewUnitSelection < Internal::Types::Model
      extend Paid::Internal::Types::Union

      member -> { Paid::Types::CustomViewUnitSelectionZero }

      member -> { Paid::Types::CustomViewUnitSelectionOne }

      member -> { Paid::Types::CustomViewUnitSelectionMode }
    end
  end
end
