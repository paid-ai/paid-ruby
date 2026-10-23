# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AnalyticsQueryRequest < Internal::Types::Model
      field :query, -> { String }, optional: false, nullable: false
    end
  end
end
