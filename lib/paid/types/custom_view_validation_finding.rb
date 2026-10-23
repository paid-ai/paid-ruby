# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewValidationFinding < Internal::Types::Model
      field :reason, -> { String }, optional: false, nullable: false

      field :error, -> { String }, optional: false, nullable: false

      field :details, -> { String }, optional: true, nullable: false
    end
  end
end
