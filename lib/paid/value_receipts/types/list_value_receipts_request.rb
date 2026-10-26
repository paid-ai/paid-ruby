# frozen_string_literal: true

module Paid
  module ValueReceipts
    module Types
      class ListValueReceiptsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"

        field :product_id, -> { String }, optional: true, nullable: false, api_name: "productId"

        field :archived, -> { Paid::ValueReceipts::Types::ListValueReceiptsRequestArchived }, optional: true, nullable: false
      end
    end
  end
end
