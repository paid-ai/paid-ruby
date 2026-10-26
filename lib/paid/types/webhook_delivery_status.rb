# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module WebhookDeliveryStatus
      extend Paid::Internal::Types::Enum

      SUCCESS = "success"
      FAILED = "failed"
    end
  end
end
