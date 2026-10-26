# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PaymentAllocationInput < Internal::Types::Model
      field :invoice_line_id, -> { String }, optional: false, nullable: false, api_name: "invoiceLineId"

      field :amount, -> { Integer }, optional: false, nullable: false

      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
