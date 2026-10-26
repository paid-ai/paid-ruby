# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # How many groups kept their own series, and how many were summed under "other". Present only when groupBy is set.
    class SignalSummaryGroups < Internal::Types::Model
      field :kept, -> { Float }, optional: false, nullable: false

      field :truncated, -> { Float }, optional: false, nullable: false
    end
  end
end
