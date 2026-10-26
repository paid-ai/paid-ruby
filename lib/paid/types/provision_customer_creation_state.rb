# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionCustomerCreationState
      extend Paid::Internal::Types::Enum

      DRAFT = "draft"
      ACTIVE = "active"
    end
  end
end
