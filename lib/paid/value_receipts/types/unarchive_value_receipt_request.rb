# frozen_string_literal: true

module Paid
  module ValueReceipts
    module Types
      class UnarchiveValueReceiptRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
