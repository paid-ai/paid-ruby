# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class GetCustomViewCustomerUnitsRequest < Internal::Types::Model
        field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"
      end
    end
  end
end
