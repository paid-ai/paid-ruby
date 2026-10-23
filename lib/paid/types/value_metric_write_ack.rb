# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueMetricWriteAck < Internal::Types::Model
      field :slug, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
