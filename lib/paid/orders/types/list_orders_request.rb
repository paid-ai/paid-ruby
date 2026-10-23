# frozen_string_literal: true

module Paid
  module Orders
    module Types
      class ListOrdersRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :creation_state, -> { Paid::Orders::Types::ListOrdersRequestCreationState }, optional: true, nullable: false, api_name: "creationState"

        field :status, -> { Paid::Orders::Types::OrderStatusFilter }, optional: true, nullable: false

        field :start_date_from, -> { String }, optional: true, nullable: false, api_name: "startDateFrom"

        field :start_date_to, -> { String }, optional: true, nullable: false, api_name: "startDateTo"

        field :end_date_from, -> { String }, optional: true, nullable: false, api_name: "endDateFrom"

        field :end_date_to, -> { String }, optional: true, nullable: false, api_name: "endDateTo"
      end
    end
  end
end
