# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerBillingAddressInput < Internal::Types::Model
      field :line1, -> { String }, optional: true, nullable: false

      field :line2, -> { String }, optional: true, nullable: false

      field :city, -> { String }, optional: true, nullable: false

      field :state, -> { String }, optional: true, nullable: false

      field :zip_code, -> { String }, optional: true, nullable: false, api_name: "zipCode"

      field :country, -> { String }, optional: true, nullable: false
    end
  end
end
