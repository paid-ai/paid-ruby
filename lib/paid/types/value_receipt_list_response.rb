# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueReceiptListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::ValueReceiptSummary] }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false
    end
  end
end
