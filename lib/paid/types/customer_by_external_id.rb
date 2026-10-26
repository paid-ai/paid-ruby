# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerByExternalID < Internal::Types::Model
      field :external_customer_id, -> { String }, optional: false, nullable: false, api_name: "externalCustomerId"
    end
  end
end
