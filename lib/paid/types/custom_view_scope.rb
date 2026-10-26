# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomViewScope
      extend Paid::Internal::Types::Enum

      CUSTOMER = "customer"
      ORGANIZATION = "organization"
    end
  end
end
