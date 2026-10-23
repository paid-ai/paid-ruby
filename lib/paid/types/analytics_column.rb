# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AnalyticsColumn < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :type, -> { String }, optional: false, nullable: false
    end
  end
end
