# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CreditGrantValue
      extend Paid::Internal::Types::Enum

      FULL = "full"
      NONE = "none"
      PRORATED = "prorated"
    end
  end
end
