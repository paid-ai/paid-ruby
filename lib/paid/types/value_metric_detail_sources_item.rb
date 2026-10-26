# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricDetailSourcesItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
