# frozen_string_literal: true

module Paid
  module Invoices
    module Types
      class GetInvoiceByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
