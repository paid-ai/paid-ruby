# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module CustomViewsExperimental
    module Types
      module CreateCustomViewRequestScope
        extend Paid::Internal::Types::Enum

        CUSTOMER = "customer"
        ORGANIZATION = "organization"
      end
    end
  end
end
