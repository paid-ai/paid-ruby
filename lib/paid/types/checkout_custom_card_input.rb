# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CheckoutCustomCardInput < Internal::Types::Model
      field :label, -> { String }, optional: false, nullable: false

      field :price_text, -> { String }, optional: true, nullable: false, api_name: "priceText"

      field :button_text, -> { String }, optional: true, nullable: false, api_name: "buttonText"

      field :button_url, -> { String }, optional: true, nullable: false, api_name: "buttonUrl"
    end
  end
end
