# frozen_string_literal: true

module Paid
  module Amendments
    module Types
      class GetOrderAmendmentOptionsRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"
      end
    end
  end
end
