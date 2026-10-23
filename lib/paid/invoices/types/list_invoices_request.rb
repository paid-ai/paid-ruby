# frozen_string_literal: true

module Paid
  module Invoices
    module Types
      class ListInvoicesRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"

        field :status, -> { Paid::Invoices::Types::ListInvoicesRequestStatus }, optional: true, nullable: false

        field :payment_status, -> { Paid::Invoices::Types::ListInvoicesRequestPaymentStatus }, optional: true, nullable: false, api_name: "paymentStatus"

        field :issue_date_from, -> { String }, optional: true, nullable: false, api_name: "issueDateFrom"

        field :issue_date_to, -> { String }, optional: true, nullable: false, api_name: "issueDateTo"

        field :due_date_from, -> { String }, optional: true, nullable: false, api_name: "dueDateFrom"

        field :due_date_to, -> { String }, optional: true, nullable: false, api_name: "dueDateTo"

        field :display_number, -> { String }, optional: true, nullable: false, api_name: "displayNumber"

        field :purchase_order_reference, -> { String }, optional: true, nullable: false, api_name: "purchaseOrderReference"

        field :currency, -> { String }, optional: true, nullable: false
      end
    end
  end
end
