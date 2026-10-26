# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalsMetadataResponseMeta < Internal::Types::Model
      field :from_date, -> { String }, optional: false, nullable: false, api_name: "fromDate"

      field :to_date, -> { String }, optional: false, nullable: false, api_name: "toDate"
    end
  end
end
