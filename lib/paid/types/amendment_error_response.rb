# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentErrorResponse < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false

      field :code, -> { String }, optional: true, nullable: false

      field :details, -> { String }, optional: true, nullable: false

      field :intent_index, -> { Integer }, optional: true, nullable: false, api_name: "intentIndex"
    end
  end
end
