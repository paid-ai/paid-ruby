# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AddFromCatalogIntentChargeStub
      extend Paid::Internal::Types::Enum

      NONE = "none"
      PRORATED = "prorated"
      FULL = "full"
    end
  end
end
