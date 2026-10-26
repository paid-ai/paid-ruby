# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class DeliveredValueSummaryResponseCustomer < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
