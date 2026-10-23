# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewQuery < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :sql, -> { String }, optional: false, nullable: false
    end
  end
end
