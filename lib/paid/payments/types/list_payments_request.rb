# frozen_string_literal: true

module Paid
  module Payments
    module Types
      class ListPaymentsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :status, -> { Paid::Payments::Types::ListPaymentsRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
