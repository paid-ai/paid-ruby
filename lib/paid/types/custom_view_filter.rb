# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewFilter < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
