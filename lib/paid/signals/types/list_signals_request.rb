# frozen_string_literal: true

module Paid
  module Signals
    module Types
      class ListSignalsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :signal_name, -> { String }, optional: true, nullable: false, api_name: "signalName"

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :product_id, -> { String }, optional: true, nullable: false, api_name: "productId"

        field :external_product_id, -> { String }, optional: true, nullable: false, api_name: "externalProductId"

        field :created_at_from, -> { String }, optional: true, nullable: false, api_name: "createdAtFrom"

        field :created_at_to, -> { String }, optional: true, nullable: false, api_name: "createdAtTo"
      end
    end
  end
end
