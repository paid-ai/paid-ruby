# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionCreatedOrderLineProvisionStatus
      extend Paid::Internal::Types::Enum

      CREATED = "created"
      UPDATED = "updated"
    end
  end
end
