# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CreditGrantResultStatus
      extend Paid::Internal::Types::Enum

      ACTIVE = "active"
    end
  end
end
