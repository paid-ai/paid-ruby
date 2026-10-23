# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerByID < Internal::Types::Model
      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"
    end
  end
end
