# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentOverridesItemScope < Internal::Types::Model
      field :customer_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "customerIds"
    end
  end
end
