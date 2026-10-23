# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerFundingInstructionsCreateRequest < Internal::Types::Model
      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
