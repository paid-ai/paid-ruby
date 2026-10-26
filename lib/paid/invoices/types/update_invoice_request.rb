# frozen_string_literal: true

module Paid
  module Invoices
    module Types
      class UpdateInvoiceRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true
      end
    end
  end
end
