# frozen_string_literal: true

module Paid
  module PaymentAllocations
    module Types
      class ListPaymentAllocationsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :payment_id, -> { String }, optional: true, nullable: false, api_name: "paymentId"

        field :invoice_id, -> { String }, optional: true, nullable: false, api_name: "invoiceId"
      end
    end
  end
end
