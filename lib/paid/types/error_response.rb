# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ErrorResponse < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false

      field :code, -> { String }, optional: true, nullable: false

      field :details, -> { String }, optional: true, nullable: false
    end
  end
end
