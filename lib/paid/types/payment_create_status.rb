# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module PaymentCreateStatus
      extend Paid::Internal::Types::Enum

      DRAFT = "draft"
      POSTED = "posted"
    end
  end
end
