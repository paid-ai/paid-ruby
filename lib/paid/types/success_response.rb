# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SuccessResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
