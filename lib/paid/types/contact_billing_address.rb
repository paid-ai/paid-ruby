# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ContactBillingAddress < Internal::Types::Model
      field :street, -> { String }, optional: true, nullable: false

      field :city, -> { String }, optional: true, nullable: false

      field :state, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :zip_code, -> { String }, optional: true, nullable: false, api_name: "zipCode"
    end
  end
end
