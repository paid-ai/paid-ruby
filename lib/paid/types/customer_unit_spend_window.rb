# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The window `spent` covers: the one requested, or the current calendar month (UTC) when none was given.
    class CustomerUnitSpendWindow < Internal::Types::Model
      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: false, nullable: false, api_name: "end"
    end
  end
end
